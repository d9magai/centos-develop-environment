#include<opencv/cv.h>
#include<opencv/highgui.h>

int main(int argc, char* argv[]) {
	IplImage *image = cvLoadImage("lena.jpg", CV_LOAD_IMAGE_COLOR);
	cvNamedWindow("window", CV_WINDOW_AUTOSIZE);
	cvShowImage("window", image);
	cvWaitKey(0);
	cvDestroyAllWindows();
	cvReleaseImage(&image);
	return 0;
}
