#ifndef DllExport
#define DllExport   __declspec( dllexport )
#endif


#include "../webstring.h"
#include "../weburl.h"

namespace Awesomium
{
	WebString dummywebstring;

	WebURL* WebURL::dummyurl = new WebURL;

	WebURL::WebURL()
	{
	};

	WebURL::WebURL(const WebString& url_string)
	{
	};

	WebURL::WebURL(const WebURL& rhs)
	{
	};

	WebURL::~WebURL()
	{
	};

	WebURL& WebURL::operator=(const WebURL& rhs)
	{
		return *dummyurl;
	};

	bool WebURL::IsValid() const
	{
		return true;
	};
	bool WebURL::IsEmpty() const
	{
		return false;
	};

	WebString WebURL::spec() const
	{
		return *WebString::dummystring;
	};

	WebString WebURL::scheme() const
	{
		return *WebString::dummystring;
	};

	WebString WebURL::username() const
	{
		return *WebString::dummystring;
	};

	WebString WebURL::password() const
	{
		return *WebString::dummystring;
	};

	WebString WebURL::host() const
	{
		return *WebString::dummystring;
	};

	WebString WebURL::port() const
	{
		return *WebString::dummystring;
	};

	WebString WebURL::path() const
	{
		return *WebString::dummystring;
	};

	WebString WebURL::query() const
	{
		return *WebString::dummystring;
	};

	WebString WebURL::anchor() const
	{
		return *WebString::dummystring;
	};

	WebString WebURL::filename() const
	{
		return *WebString::dummystring;
	};

	bool WebURL::operator==(const WebURL& other) const
	{
		return false;
	};
	bool WebURL::operator!=(const WebURL& other) const
	{
		return false;
	};
	bool WebURL::operator<(const WebURL& other) const
	{
		return false;
	};
}