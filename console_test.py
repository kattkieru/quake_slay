import ctypes
import sdl2
from sdl2 import *
from imgui.integrations.sdl2 import SDL2Renderer
import imgui


def main():
	SDL_Init(SDL_INIT_VIDEO)

	win = SDL_CreateWindow(
		b"Hello World",
		100,
		100,
		1280,
		720,
		SDL_WINDOW_SHOWN
		)

	imgui.create_context()
	imgui.get_io().display_size = 100, 100
	imgui.get_io().fonts.get_tex_data_as_rgba32()

	renderer = SDL2Renderer(win)

	# ren = SDL_CreateRenderer(
	# 	win,
	# 	-1,
	# 	SDL_RENDERER_ACCELERATED | SDL_RENDERER_PRESENTVSYNC
	# )

	# event = SDL_Event()

	running = True

	while running:
		while SDL_PollEvent(ctypes.byref(event)) != 0:
					if event.type == SDL_QUIT:
						running = False
						break

		SDL_RenderClear(renderer)
		# SDL_RenderCopy(ren, tex, None, None)

		# start new frame context
		imgui.new_frame()

		# open new window context
		imgui.begin("Your first window!", True)

		# draw text label inside of current window
		imgui.text("Hello world!")

		# close current window context
		imgui.end()

		# pass all drawing comands to the rendering pipeline
		# and close frame context
		imgui.render()
		imgui.end_frame()

		SDL_RenderPresent(renderer)
		# SDL_Delay(100)

	SDL_DestroyRenderer(renderer)
	SDL_DestroyWindow(win)
	SDL_Quit()
	return 0


if __name__ == "__main__":
	main()
