// Copyright (c) 2021 by Apex.AI Inc. All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
// SPDX-License-Identifier: Apache-2.0

#ifndef IOX_POSH_POPO_ENUM_TRIGGER_TYPE_HPP
#define IOX_POSH_POPO_ENUM_TRIGGER_TYPE_HPP

#include "iceoryx_utils/cxx/type_traits.hpp"

#include <cstdint>

namespace iox
{
namespace popo
{
using StateEnumIdentifier = uint64_t;
using EventEnumIdentifier = int64_t;

template <typename T>
constexpr bool IS_EVENT_ENUM =
    std::is_enum<T>::value&& std::is_same<std::underlying_type_t<T>, EventEnumIdentifier>::value;

template <typename T>
constexpr bool IS_STATE_ENUM =
    std::is_enum<T>::value&& std::is_same<std::underlying_type_t<T>, StateEnumIdentifier>::value;
} // namespace popo
} // namespace iox

#endif
