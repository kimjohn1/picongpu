/* Copyright 2021 Sergei Bastrakov
 *
 * This file is part of PIConGPU.
 *
 * PIConGPU is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * PIConGPU is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with PIConGPU.
 * If not, see <http://www.gnu.org/licenses/>.
 */

#pragma once

#include "picongpu/simulation_defines.hpp"


namespace picongpu
{
    namespace particles
    {
        namespace functor
        {
            namespace misc
            {
                template<typename T_Parameters>
                struct Parametrized
                {
                    //! Parameters type
                    using Parameters = T_Parameters;

                    //! Construct a functor, copy static parameters() into the member
                    HINLINE Parametrized() : m_parameters(parameters())
                    {
                    }

                    //! Pass the parameters from the host side by changing this value
                    static Parameters& parameters()
                    {
                        static auto staticParameters = Parameters{};
                        return staticParameters;
                    }

                protected:
                    //! Parameters values to be accessed on the device side
                    T_Parameters m_parameters;
                };

            } // namespace misc
        } // namespace functor
    } // namespace particles
} // namespace picongpu
