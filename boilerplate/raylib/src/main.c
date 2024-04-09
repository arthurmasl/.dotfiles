#include "main.h"
#include <raylib.h>

int main() {
  SetConfigFlags(FLAG_WINDOW_UNFOCUSED);
  SetConfigFlags(FLAG_WINDOW_RESIZABLE);

  InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, "main");
  SetWindowPosition(WINDOW_X, WINDOW_Y);
  SetTargetFPS(GetMonitorRefreshRate(0));

  while (!WindowShouldClose()) {
    BeginDrawing();
    ClearBackground(RAYWHITE);

    DrawFPS(10, 10);
    EndDrawing();
  }

  CloseWindow();
  return 0;
}
