#ifndef DllExport
#define DllExport   __declspec( dllexport )
#endif

#pragma pack(push)
#pragma pack(1)

#include "../webpreferences.h"
#include "../webstring.h"

namespace Awesomium
{
	WebPreferences WebPreferences::dummypreferences;

	WebPreferences::WebPreferences()
	{

	}
}

#pragma pack(pop)