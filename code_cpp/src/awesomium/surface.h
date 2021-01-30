#pragma once

#ifndef DllExport
#define DllExport   __declspec( dllexport )
#endif

namespace Awesomium
{


	class DllExport Surface
	{
	public:
		virtual ~Surface();
		virtual void Paint(unsigned  char* src, int span, void*& srcrect, void*& destrect);
		virtual void Scroll(unsigned  char* src, int span, void*& srcrect, void*& destrect);

	};

}