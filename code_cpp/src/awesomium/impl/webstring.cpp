#ifndef DllExport
#define DllExport   __declspec( dllexport )
#endif

#include "../webstring.h"

namespace Awesomium
{
	WebString* WebString::dummystring = new WebString;

	WebString::WebString()
	{
	};

	WebString::WebString(const WebString& src, unsigned int pos, unsigned int n)
	{
	};

	WebString::WebString(const unsigned short* data)
	{
	};

	WebString::WebString(const unsigned short* data, unsigned int len)
	{
	};

	WebString::WebString(const WebString& src)
	{
	};

	WebString::~WebString()
	{
	};

	WebString& WebString::operator=(const WebString& rhs)
	{
		return *WebString::dummystring;
	};


	WebString WebString::CreateFromUTF8(const char* str, unsigned int len)
	{
		WebString::dummystring->Clear();

		return *WebString::dummystring;
	};

	const unsigned short* WebString::data() const
	{
		return (unsigned short*)WebString::dummystring;
	};

	unsigned int WebString::length() const
	{
		return 1;
	};


	bool WebString::IsEmpty() const
	{
		return true;
	};

	int WebString::Compare(const WebString& src) const
	{
		return 1;
	};

	WebString& WebString::Assign(const WebString& src)
	{
		return *dummystring;
	};

	WebString& WebString::Assign(const WebString& src, unsigned int pos, unsigned int n)
	{
		return *dummystring;
	};

	WebString& WebString::Assign(const unsigned short* data)
	{
		return *dummystring;
	};

	WebString& WebString::Assign(const unsigned short* data, unsigned int len)
	{
		return *dummystring;
	};

	WebString& WebString::Append(const WebString& src)
	{
		return *dummystring;
	};

	void WebString::Swap(WebString& src)
	{
		src = *dummystring;
	};

	void WebString::Clear()
	{
		instance_ = dummystring;
	};

	unsigned int WebString::ToUTF8(char* dest, unsigned int len) const
	{
		return 1;
	};

	bool WebString::operator==(const WebString& other) const
	{
		return true;
	};
	bool WebString::operator!=(const WebString& other) const
	{
		return true;
	};
	bool WebString::operator<(const WebString& other) const
	{
		return true;
	};


	WebString::WebString(const void* internal_instance)
	{
		instance_ = dummystring;
	};
}