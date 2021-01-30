#ifndef DllExport
#define DllExport   __declspec( dllexport )
#endif

#include "../uploadelement.h"
#include "../webstring.h"

namespace Awesomium
{
	bool UploadElement::IsFilePath() const
	{
		return false;
	};

	bool UploadElement::IsBytes()
	{
		return false;
	};

	unsigned int UploadElement::num_bytes()
	{
		return 1;
	};
	const unsigned char* UploadElement::bytes()
	{
		return 0;
	};

	WebString UploadElement::file_path()
	{
		return *WebString::dummystring;
	};

	UploadElement::~UploadElement()
	{
	}
}