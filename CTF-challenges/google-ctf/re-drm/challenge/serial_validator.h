// Copyright 2018 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

// Author: Ian Eldred Pudney

#include <cstddef>
#include "md5.h"

void result(unsigned int);

bool validate_serial(unsigned char* data, int size,
                      const char* md5_init_func, size_t md5_init_len,
                      const char* md5_update_func, size_t md5_update_len,
                      const char* md5_final_func, size_t md5_final_len,
                      decltype(result) result_func);
bool fake_validate_serial(unsigned char* data, int size,
                          const char* md5_init_func, size_t md5_init_len,
                          const char* md5_update_func, size_t md5_update_len,
                          const char* md5_final_func, size_t md5_final_len,
                          decltype(result) result_func);

