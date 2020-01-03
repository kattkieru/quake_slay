#include <AvailabilityMacros.h>
#import <Metal/Metal.h>
#import <QuartzCore/CAMetalLayer.h>

#if TARGET_OS_SIMULATOR || (!TARGET_CPU_X86_64 && !TARGET_CPU_ARM64)
#error Metal doesn't work on this configuration
#endif

int main()
{
	return 0;
}
