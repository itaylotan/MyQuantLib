
/*
 * Copyright (C) 2000-2001 QuantLib Group
 *
 * This file is part of QuantLib.
 * QuantLib is a C++ open source library for financial quantitative
 * analysts and developers --- http://quantlib.sourceforge.net/
 *
 * QuantLib is free software and you are allowed to use, copy, modify, merge,
 * publish, distribute, and/or sell copies of it under the conditions stated
 * in the QuantLib License.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
 * or FITNESS FOR A PARTICULAR PURPOSE. See the license for more details.
 *
 * You should have received a copy of the license along with this file;
 * if not, contact ferdinando@ametrano.net
 * The license is also available at http://quantlib.sourceforge.net/LICENSE.TXT
 *
 * The members of the QuantLib Group are listed in the Authors.txt file, also
 * available at http://quantlib.sourceforge.net/Authors.txt
*/

/*
    $Id$
    $Source$
    $Log$
    Revision 1.35  2001/04/09 12:24:58  nando
    updated copyright notice header and improved CVS tags

*/


%module QuantLib

%{
#include "quantlib.hpp"
%}

%{
using QuantLib::Error;
using QuantLib::IndexError;
%}

%except(python) {
    try {
        $function
    } catch (IndexError& e) {
        PyErr_SetString(PyExc_IndexError,e.what());
        return NULL;
    } catch (Error& e) {
        PyErr_SetString(PyExc_Exception,e.what());
        return NULL;
    } catch (std::exception& e) {
        PyErr_SetString(PyExc_Exception,e.what());
        return NULL;
    } catch (...) {
        PyErr_SetString(PyExc_Exception,"unknown error");
        return NULL;
    }
}

%except(ruby) {
    try {
        $function
    } catch (IndexError& e) {
        rb_raise(rb_eIndexError,e.what());
    } catch (Error& e) {
        rb_raise(rb_eStandardError,e.what());
    } catch (std::exception& e) {
        rb_raise(rb_eStandardError,e.what());
    } catch (...) {
        rb_raise(rb_eStandardError,"unknown error");
    }
}

#if defined(SWIGPYTHON) || defined(SWIGRUBY)
%include Calendars.i
%include Currencies.i
%include Date.i
%include DayCounters.i
%include Distributions.i
%include RandomGenerators.i
%include Statistics.i
%include Solvers1D.i
%include String.i
%include Vectors.i
#endif

#if defined(SWIGPYTHON)
%include Barrier.i
%include BoundaryConditions.i
%include Financial.i
%include History.i
%include Instruments.i
%include Interpolation.i
%include Matrix.i
%include MontecarloPricers.i
%include MontecarloTools.i
%include Operators.i
%include Options.i
%include Pricers.i
%include QLArray.i
%include RiskStatistics.i
%include TermStructures.i
#endif


