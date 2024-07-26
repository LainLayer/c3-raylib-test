module main;

import std::io;

extern fn void init_window(CInt, CInt, CChar*)            @extern("InitWindow");
extern fn void set_target_fps(CInt)                       @extern("SetTargetFPS");
extern fn CInt window_should_close()                      @extern("WindowShouldClose");
extern fn void begin_drawing()                            @extern("BeginDrawing");
extern fn void end_drawing()                              @extern("EndDrawing");
extern fn void clear_background(CUInt)                    @extern("ClearBackground");
extern fn void close_window()                             @extern("CloseWindow");
extern fn void draw_text(CChar*, CInt, CInt, CInt, CUInt) @extern("DrawText");
extern fn void draw_line_v(float[<2>], float[<2>], CUInt) @extern("DrawLineV");

macro CUInt @color(char $a, char $r, char $g, char $b) {
    return ($a << 8*3) +
           ($b << 8*2) +
           ($g << 8*1) +
           ($r << 8*0);
}

const CUInt RED = @color(255, 100, 200, 50);

fn void main() {
    io::printn("Hello, World!");

    const int SCREEN_WIDTH  = 800;
    const int SCREEN_HEIGHT = 450;

    init_window(SCREEN_WIDTH, SCREEN_HEIGHT, "raylib [core] example - basic window");

    set_target_fps(60);

    while (!window_should_close())
    {
        begin_drawing();

            clear_background(0xFFFFFFFF);
            draw_text("Congrats! You created your first window!", 190, 200, 20, RED);

            draw_line_v({0,0}, {100, 100}, @color(255, 0, 0, 0));

        end_drawing();

    }

    close_window();
}
