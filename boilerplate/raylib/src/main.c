#include <raylib.h>
#include "main.h"

int main() {
  SetConfigFlags(FLAG_WINDOW_RESIZABLE);
  InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, "ray3d");
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
