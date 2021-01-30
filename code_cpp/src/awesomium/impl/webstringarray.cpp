#pragma once

#ifndef DllExport
#define DllExport   __declspec( dllexport )
#endif

#include "../webstring.h"
#include "../webstringarray.h"

#pragma pack(push)
#pragma pack(1)

namespace Awesomium
{
	WebString* WebStringArray::dummystring = new WebString;
	WebStringArray* WebStringArray::dummyarray = new WebStringArray;

	WebStringArray::WebStringArray()
	{

	};

	WebStringArray::WebStringArray(unsigned int n)
	{

	};

	WebStringArray::WebStringArray(const WebStringArray& rhs)
	{

	};

	WebStringArray::~WebStringArray()
	{
	};

	WebStringArray& WebStringArray::operator=(const WebStringArray& rhs)
	{
		return *dummyarray;
	};

	unsigned int WebStringArray::size() const
	{
		return 0;
	};
	WebString& WebStringArray::At(unsigned int idx)
	{
		return *dummystring;
	};
	const WebString& WebStringArray::At(unsigned int idx) const
	{
		return *dummystring;
	};
	WebString& WebStringArray::operator[](unsigned int idx)
	{
		return *dummystring;
	};
	const WebString& WebStringArray::operator[](unsigned int idx) const
	{
		return *dummystring;
	};
	void WebStringArray::Push(const WebString& item)
	{
	};
}

#pragma pack(pop)