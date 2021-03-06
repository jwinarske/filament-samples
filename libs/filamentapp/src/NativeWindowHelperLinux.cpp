/*
 * Copyright (C) 2015 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <filamentapp/NativeWindowHelper.h>

#include <utils/Panic.h>

#include <SDL2/SDL_syswm.h>

void* getNativeWindow(SDL_Window* sdlWindow) {
    SDL_SysWMinfo wmi;
    SDL_VERSION(&wmi.version);
    ASSERT_POSTCONDITION(SDL_GetWindowWMInfo(sdlWindow, &wmi), "SDL version unsupported!");
    if (wmi.subsystem == SDL_SYSWM_X11) {
#if defined(FILAMENT_SUPPORTS_X11)
        Window win = (Window) wmi.info.x11.window;
        return (void *) win;
#endif
    }
    else if (wmi.subsystem == SDL_SYSWM_WAYLAND) {
#if defined(FILAMENT_SUPPORTS_WAYLAND)
        return wmi.info.wl.display;
#endif
    }
    return nullptr;
}
