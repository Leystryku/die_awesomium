#ifndef DllExport
#define DllExport   __declspec( dllexport )
#endif

#include "webstring.h"

namespace Awesomium
{
	class DllExport BitmapSurface
	{
	public:
		BitmapSurface(int width, int height);
		~BitmapSurface();

		const unsigned char* buffer() const;
		int width() const;
		int height() const;
		int row_span() const;

		void set_is_dirty(bool is_dirty);
		bool is_dirty() const;

		void CopyTo(unsigned char* dst, int dst_row, int dst_depth, bool convert, bool flipy) const;
		bool SaveToPNG(const Awesomium::WebString* file_path, bool preserve_transparency = false);
		bool SaveToJPEG(const Awesomium::WebString* file_path, int quality = 90);
		unsigned char GetAlphaAtPoint(int x, int y) const;
		void Paint(unsigned char* src, int src_row_span, const void*& src_rect, const void*& dst_rect);
		void Scroll(int dx, int dy, const void*& clip_rect);

	private:
		unsigned char* buffer_;
		int width_;
		int height_;
		int row_span_;
		bool is_dirty_;
	};

	void DllExport CopyBuffers(int w, int h, unsigned char* src, int r, unsigned char* dst,
		int dr, int dd, bool rgba, bool flip_y);
}