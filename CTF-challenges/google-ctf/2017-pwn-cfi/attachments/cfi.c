/*
 * Copyright 2018 Google LLC
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



#include <err.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>

int main() {
  char buf[32] = "";

  system("/bin/echo 'addr?'");
  read(STDIN_FILENO, buf, sizeof(buf));
  char *addr = (char*) strtoull(buf, NULL, 16);

  system("/bin/echo 'len?'");
  read(STDIN_FILENO, buf, sizeof(buf));
  size_t len = strtoull(buf, NULL, 16);

  system("/bin/echo 'data?'");
  read(STDIN_FILENO, addr, len);

  return 0;
}
