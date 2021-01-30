#ifndef DllExport
#define DllExport   __declspec( dllexport )
#endif

#include "webstring.h"


namespace Awesomium
{
	class DllExport UploadElement {
	public:
		virtual bool IsFilePath() const;
		virtual bool IsBytes();
		virtual unsigned int num_bytes();
		virtual const unsigned char* bytes();
		virtual WebString file_path();
	protected:
		virtual ~UploadElement();
	};
}