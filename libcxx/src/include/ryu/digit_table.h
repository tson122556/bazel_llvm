//===----------------------------------------------------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

// Copyright (c) Microsoft Corporation.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

// Copyright 2018 Ulf Adams
// Copyright (c) Microsoft Corporation. All rights reserved.

// Boost Software License - Version 1.0 - August 17th, 2003

// Permission is hereby granted, free of charge, to any person or organization
// obtaining a copy of the software and accompanying documentation covered by
// this license (the "Software") to use, reproduce, display, distribute,
// execute, and transmit the Software, and to prepare derivative works of the
// Software, and to permit third-parties to whom the Software is furnished to
// do so, all subject to the following:

// The copyright notices in the Software and this entire statement, including
// the above license grant, this restriction and the following disclaimer,
// must be included in all copies of the Software, in whole or in part, and
// all derivative works of the Software, unless such copies or derivative
// works are solely in the form of machine-executable object code generated by
// a source language processor.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT
// SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE
// FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE,
// ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
// DEALINGS IN THE SOFTWARE.

#ifndef _LIBCPP_SRC_INCLUDE_RYU_DIGIT_TABLE_H
#define _LIBCPP_SRC_INCLUDE_RYU_DIGIT_TABLE_H

// Avoid formatting to keep the changes with the original code minimal.
// clang-format off

#include <__config>

_LIBCPP_BEGIN_NAMESPACE_STD

// A table of all two-digit numbers. This is used to speed up decimal digit
// generation by copying pairs of digits into the final output.
inline constexpr char __DIGIT_TABLE[200] = {
  '0','0','0','1','0','2','0','3','0','4','0','5','0','6','0','7','0','8','0','9',
  '1','0','1','1','1','2','1','3','1','4','1','5','1','6','1','7','1','8','1','9',
  '2','0','2','1','2','2','2','3','2','4','2','5','2','6','2','7','2','8','2','9',
  '3','0','3','1','3','2','3','3','3','4','3','5','3','6','3','7','3','8','3','9',
  '4','0','4','1','4','2','4','3','4','4','4','5','4','6','4','7','4','8','4','9',
  '5','0','5','1','5','2','5','3','5','4','5','5','5','6','5','7','5','8','5','9',
  '6','0','6','1','6','2','6','3','6','4','6','5','6','6','6','7','6','8','6','9',
  '7','0','7','1','7','2','7','3','7','4','7','5','7','6','7','7','7','8','7','9',
  '8','0','8','1','8','2','8','3','8','4','8','5','8','6','8','7','8','8','8','9',
  '9','0','9','1','9','2','9','3','9','4','9','5','9','6','9','7','9','8','9','9'
};

_LIBCPP_END_NAMESPACE_STD

// clang-format on

#endif // _LIBCPP_SRC_INCLUDE_RYU_DIGIT_TABLE_H
