#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <iostream>
#include <ctype.h>

using namespace std;
using namespace cv;

Mat& Erosion(Mat &I, Mat &SE, int bg);
Mat& Dilation(Mat &I, Mat &SE, int bg);
Mat& Opening(Mat &I, Mat &SE, int bg);
Mat& Closing(Mat &I, Mat &SE, int bg);
Mat& Boundary(Mat &I, int bg);
void help();

void help()
{
        cout << "Usage: ";
        cout << "./Morphological_Operators e <image> ";
        cout << "<structuring element> (erosion)";
        cout << endl;
        cout << "       ./Morphological_Operators d <image> ";
        cout << "<structuring element> (dilation)";
        cout << endl;
        cout << "       ./Morphological_Operators o <image> ";
        cout << "<structuring element> (opening)";
        cout << endl;
        cout << "       ./Morphological_Operators c <image> ";
        cout << "<structuring element> (closing)"; 
        cout << endl;
        cout << "       ./Morphological_Operators b <image> (boundary)";
        cout << endl;
}

int main(int argc, char* argv[])
{
    if (argc < 3 || argc > 4)
    {
        help();
        return -1;
    }

    Mat img_in, img_out;
    img_in = imread(argv[2], CV_LOAD_IMAGE_GRAYSCALE);

    if (!img_in.data)
    {
        cout << "The image" << argv[2] << " could not be loaded." << endl;
        return -1;
    }

    cv::Mat img_in_clone = img_in.clone();

    char *opChar = argv[1];
    if (strlen(opChar) > 1)
    {
        help();
        return -1;
    }
    int op = tolower(opChar[0]);

    switch (op)
    {
        case 101:
        {
            if (argc != 4)
            {
                help();
                return -1;
            }
            img_out = Erosion(img_in_clone, img_in_clone, 0);
            break;
        }
        case 100:
        {
            if (argc != 4)
            {
                help();
                return -1;
            }
            img_out = Dilation(img_in_clone, img_in_clone, 0);
            break;
        }
        case 111:
        {
            if (argc != 4)
            {
                help();
                return -1;
            }
            img_out = Opening(img_in_clone, img_in_clone, 0);
            break;
        }
        case 99:
        {
            if (argc != 4)
            {
                help();
                return -1;
            }
            img_out = Closing(img_in_clone, img_in_clone, 0);
            break;
        }
        case 98:
        {
            if (argc != 3)
            {
                help();
                return -1;
            }
            img_out = Boundary(img_in_clone, 0);
            break;
        }
        default:
        {
            help();
            break;
        }
    }
}

Mat& Erosion(Mat &I, Mat &SE, int bg)
{
    return I;
}

Mat& Dilation(Mat &I, Mat &SE, int bg)
{
    return I;
}

Mat& Opening(Mat &I, Mat &SE, int bg)
{
    return I;
}

Mat& Closing(Mat &I, Mat &SE, int bg)
{
    return I;
}

Mat& Boundary(Mat &I, int bg)
{
    return I;
}

/*Mat& LabelComponents(Mat& I, int bg, int threshold)
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
}*/
