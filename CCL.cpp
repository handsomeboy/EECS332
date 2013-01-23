#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <iostream>
#include <map>
#include <set>

using namespace std;
using namespace cv;

Mat& LabelComponents(Mat& I, int bg, int threshold);
Mat& ReduceLabels(Mat& I, int bg, map<int,set<int> > equiv);
set<int> SizeFilter(Mat& I, int bg, set<int> components, int threshold);

int main( int argc, char* argv[])
{
    if (argc < 2 || argc > 3)
    {
        cout << "Wrong number of parameters. Please only use an input image file and an [optional] size filter (in pixels)." << endl;
        return -1;
    }

    Mat I, J;
    I = imread(argv[1], CV_LOAD_IMAGE_GRAYSCALE);

    if (!I.data)
    {
        cout << "The image" << argv[1] << " could not be loaded." << endl;
        return -1;
    }

    int threshold = 0;
    if (argc == 3)
    {
        threshold = atoi(argv[2]);
    }

    cv::Mat clone_i = I.clone();

    J = LabelComponents(clone_i, 0, threshold);
}

Mat& LabelComponents(Mat& I, int bg, int threshold)
{
    int channels = I.channels();
    int numRows = I.rows;
    int numCols = I.cols * channels;
    int newLabel = 1;
    int i,j;
    map<int, set<int> > equiv;
    uchar *p1, *p2;

    for(i = 0; i < numRows; i++)
    {
        p1 = I.ptr<uchar>(i);
        (i > 0) ? p2 = I.ptr<uchar>(i - 1) : p2 = 0;

        for (j = 0; j < numCols; j += channels)
        {
            uchar test = p1[j];
            uchar testLeft, testTop;
            (i > 0) ? testTop = p2[j] : testTop = 0;
            (j > 0) ? testLeft = p1[j-1] : testLeft = 0;

            if (test != bg)
            {
                if (testLeft == testTop && testTop != 0)
                {
                    p1[j] = testTop;
                }
                else if (testLeft == 0 && testTop != 0)
                {
                    p1[j] = testTop;
                }
                else if (testLeft != 0 && testTop == 0)
                {
                    p1[j] = testLeft;
                }
                else if (testLeft != testTop && testTop != 0 && testLeft != 0)
                {
                    p1[j] = min(testTop, testLeft);
                    uchar maxLabel = max(testTop, testLeft);
                    uchar minLabel = min(testTop, testLeft);
                    equiv[maxLabel].insert(minLabel);
                }
                else
                {
                    p1[j] = newLabel;
                    equiv[newLabel].insert(newLabel);
                    newLabel++;
                }
            }
            else
            {
                p1[j] = 0;
            }
        }
    }
    
    map<int,set<int> >::iterator pos;
    bool changed = true;

    while (changed)
    {
        changed = false;
        for (pos = equiv.begin(); pos != equiv.end(); pos++) {
            map<int,set<int> >::iterator current = pos;
            while (current->first != *min_element(current->second.begin(), current->second.end()))
            {
                current = equiv.find(*min_element(current->second.begin(), current->second.end()));
            }
            set<int>::iterator pos2;
            for (pos2 = pos->second.begin(); pos2 != pos->second.end(); pos2++)
            {
                if ((equiv.find(*pos2)->second.insert(*current->second.begin())).second)
                {
                    changed = true;
                }
            }
            pos->second.insert(*current->second.begin());
        }
    }
    
    set<int> components;

    ReduceLabels(I, bg, equiv);

    for (pos = equiv.begin(); pos != equiv.end(); pos++) {
        if (pos->second.size() == 1)
        {
            components.insert(pos->first);
        }
    }

    if (threshold > 0)
    {
        components = SizeFilter(I, bg, components, threshold);
    }

    cout << "The total number of components is: " << components.size() << endl;
    cout << "The connected components are labeled with the following numbers: ";
    set<int>::iterator it;
    for (it = components.begin(); it!=components.end(); it++) {
       cout << *it << " ";
    }
    cout << endl;

    return I;
}

Mat& ReduceLabels(Mat& I, int bg, map<int,set<int> > equiv)
{
    int channels = I.channels();
    int numRows = I.rows;
    int numCols = I.cols * channels;
    int i,j;
    uchar *p1, *p2;

    for(i = 0; i < numRows; i++)
    {
        p1 = I.ptr<uchar>(i);

        for (j = 0; j < numCols; j += channels)
        {
            uchar test = p1[j];

            if (test != bg)
            {
                map<int,set<int> >::iterator minLabel;
                minLabel = equiv.find(test);
                p1[j] = *min_element(minLabel->second.begin(), minLabel->second.end());
            }
        }
    }
    return I;
}

set<int> SizeFilter(Mat& I, int bg, set<int> components, int threshold)
{
    int channels = I.channels();
    int numRows = I.rows;
    int numCols = I.cols * channels;
    int i,j;
    uchar *p1, *p2;
    map<int, int> sizeFilter;

    for(i = 0; i < numRows; i++)
    {
        p1 = I.ptr<uchar>(i);

        for (j = 0; j < numCols; j += channels)
        {
            uchar test = p1[j];

            if (test != bg)
            {
                if (sizeFilter.find(test) == sizeFilter.end())
                {
                    sizeFilter[test] = 1;
                }
                else
                {
                    sizeFilter[test]++;
                }
            }
        }
    }

    for(i = 0; i < numRows; i++)
    {
        p1 = I.ptr<uchar>(i);

        for (j = 0; j < numCols; j += channels)
        {
            uchar test = p1[j];

            if (test != bg)
            {
                if (sizeFilter[test] <= threshold)
                {
                    p1[j] = 0;
                    components.erase(test);
                }
            }
        }
    }
    return components;
} 
