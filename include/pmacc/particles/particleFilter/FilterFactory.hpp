/* Copyright 2013-2021 Rene Widera
 *
 * This file is part of PMacc.
 *
 * PMacc is free software: you can redistribute it and/or modify
 * it under the terms of either the GNU General Public License or
 * the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * PMacc is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License and the GNU Lesser General Public License
 * for more details.
 *
 * You should have received a copy of the GNU General Public License
 * and the GNU Lesser General Public License along with PMacc.
 * If not, see <http://www.gnu.org/licenses/>.
 */


#pragma once

#include "pmacc/meta/conversion/MakeSeq.hpp"
#include "pmacc/particles/boostExtension/InheritGenerators.hpp"
#include "pmacc/particles/memory/frames/NullFrame.hpp"
#include "pmacc/particles/particleFilter/system/DefaultFilter.hpp"
#include "pmacc/particles/particleFilter/system/TrueFilter.hpp"

#include <boost/mpl/back_inserter.hpp>
#include <boost/mpl/copy.hpp>
#include <boost/mpl/front_inserter.hpp>
#include <boost/mpl/list.hpp>
#include <boost/mpl/vector.hpp>

namespace pmacc
{
    template<typename UserTypeList = bmpl::vector<NullFrame>>
    class FilterFactory
    {
    public:
        using FilterType =
            typename LinearInherit<typename MakeSeq<DefaultFilter<>, UserTypeList, TrueFilter>::type>::type;
    };

} // namespace pmacc
