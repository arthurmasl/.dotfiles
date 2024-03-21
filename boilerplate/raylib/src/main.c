#include "main.h"
#include <raylib.h>

int main() {
  SetConfigFlags(FLAG_WINDOW_UNFOCUSED);
  InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, "main");
  SetWindowPosition(WINDOW_X, WINDOW_Y);
  SetTargetFPS(60);

  while (!WindowShouldClose()) {
    BeginDrawing();
    ClearBackground(WHITE);

    DrawFPS(10, 10);
    EndDrawing();
  }

  CloseWindow();
  return 0;
}
