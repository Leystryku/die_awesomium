#ifndef DllExport
#define DllExport   __declspec( dllexport )
#endif

#include "../webstring.h"
#include "../bitmapsurface.h"

char* dummybuf = "dummy";

namespace Awesomium
{


	BitmapSurface::BitmapSurface(int width, int height)
	{
	};

	BitmapSurface::~BitmapSurface()
	{
	};

	const unsigned char* BitmapSurface::buffer() const
	{
		return (unsigned char*)dummybuf;
	};

	int BitmapSurface::width() const
	{
		return 2;
	};

	int BitmapSurface::height() const
	{
		return 2;
	};

	int BitmapSurface::row_span() const
	{
		return 2;
	};

	void BitmapSurface::set_is_dirty(bool is_dirty)
	{
	};

	bool BitmapSurface::is_dirty() const
	{
		return false;
	};

	void BitmapSurface::CopyTo(unsigned char* dst, int dst_row, int dst_depth, bool convert, bool flipy) const
	{
	};

	bool BitmapSurface::SaveToPNG(const WebString* file_path, bool preserve_transparency)
	{
		return false;
	};

	bool BitmapSurface::SaveToJPEG(const WebString* file_path, int quality)
	{
		return false;
	};

	unsigned char BitmapSurface::GetAlphaAtPoint(int x, int y) const
	{
		return 255;
	};

	void BitmapSurface::Paint(unsigned char* src, int src_row_span, const void*& src_rect, const void*& dst_rect)
	{
	};

	void BitmapSurface::Scroll(int dx, int dy, const void*& clip_rect)
	{
	}


	void DllExport CopyBuffers(int w, int h, unsigned char* src, int r, unsigned char* dst,
		int dr, int dd, bool rgba, bool flip_y)
	{
	};

}