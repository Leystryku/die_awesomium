#pragma once

#ifndef DllExport
#define DllExport   __declspec( dllexport )
#endif

#include "webstring.h"

#pragma pack(push)
#pragma pack(1)

namespace Awesomium {
	class DllExport WebStringArray {
	public:
		WebStringArray();
		explicit WebStringArray(unsigned int n);
		WebStringArray(const WebStringArray& rhs);
		~WebStringArray();

		WebStringArray& operator=(const WebStringArray& rhs);

		unsigned int size() const;
		WebString& At(unsigned int idx);
		const WebString& At(unsigned int idx) const;
		WebString& operator[](unsigned int idx);
		const WebString& operator[](unsigned int idx) const;
		void Push(const WebString& item);

		static WebString*dummystring;
		static WebStringArray*dummyarray;

	protected:
		WebVector<WebString>* vector_;
	};
}


#pragma pack(pop)