#pragma once

#ifndef DllExport
#define DllExport   __declspec( dllexport )
#endif

namespace Awesomium {
	namespace WebViewListener
	{

		class DllExport Load
		{
		protected:
			virtual __thiscall ~Load(void);
		};

		class DllExport View
		{
		protected:
			virtual __thiscall ~View(void);
		};

	};
}