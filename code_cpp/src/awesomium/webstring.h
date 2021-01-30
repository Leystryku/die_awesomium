#pragma once

#ifndef DllExport
#define DllExport   __declspec( dllexport )
#endif

namespace Awesomium {

	template<class T>
	class WebVector;

	class DllExport WebString
	{
	public:
		explicit WebString();
		explicit WebString(const WebString& src, unsigned int pos, unsigned int n);
		explicit WebString(const unsigned short*data);
		explicit WebString(const unsigned short*data, unsigned int len);
		WebString(const WebString&src);
		~WebString();
		WebString& operator=(const WebString&rhs);


		static WebString CreateFromUTF8(const char* str, unsigned int len);

		const unsigned short*data() const;

		unsigned int length() const;


		bool IsEmpty() const;

		int Compare(const WebString&src) const;

		WebString& Assign(const WebString& src);
		WebString& Assign(const WebString& src, unsigned int pos, unsigned int n);
		WebString& Assign(const unsigned short* data);
		WebString& Assign(const unsigned short* data, unsigned int len);
		WebString& Append(const WebString& src);
		void Swap(WebString& src);

		void Clear();

		unsigned int ToUTF8(char*dest, unsigned int len) const;

		bool operator==(const WebString&other) const;
		bool operator!=(const WebString&other) const;
		bool operator<(const WebString&other) const;


		static WebString*dummystring;
	private:
		explicit WebString(const void*internal_instance);
		void*instance_;
		friend class InternalHelper;
	};
}