#ifndef DllExport
#define DllExport   __declspec( dllexport )
#endif

#include "../surface.h"

namespace Awesomium
{

	Surface::~Surface()
	{
	};

	void Surface::Paint(unsigned  char* src, int span, void*& srcrect, void*& destrect)
	{
		for (int i = 0; i < span; i++)
		{
			src[i] = i & 0xFF;
		}
	};
	void Surface::Scroll(unsigned  char* src, int span, void*& srcrect, void*& destrect)
	{
		for (int i = 0; i < span; i++)
		{
			src[i] = i;
		}
	};

}