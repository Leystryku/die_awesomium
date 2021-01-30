#pragma once

#ifndef DllExport
#define DllExport   __declspec( dllexport )
#endif


#include "webstring.h"

namespace Awesomium {
	class DllExport WebURL
	{
	public:
		WebURL();
		explicit WebURL(const WebString& url_string);
		WebURL(const WebURL& rhs);

		~WebURL();

		WebURL& operator=(const WebURL& rhs);

		bool IsValid() const;
		bool IsEmpty() const;
		WebString spec() const;
		WebString scheme() const;
		WebString username() const;
		WebString password() const;
		WebString host() const;
		WebString port() const;
		WebString path() const;
		WebString query() const;
		WebString anchor() const;
		WebString filename() const;

		bool operator==(const WebURL& other) const;
		bool operator!=(const WebURL& other) const;
		bool operator<(const WebURL& other) const;

		static WebURL* dummyurl;

	private:
		explicit WebURL(const void* internal_instance);
		void* instance_;
		friend class InternalHelper;
	};
}