# SPDX-License-Identifier: BSD-3-Clause
# Copyright 2018-2019, Intel Corporation

#
# src/test/obj_extend/TEST6 -- unit test for extending the pool
# negative scenario - missing SINGLEHDR option
# (pmem/issues#822)
#

. ..\unittest\unittest.ps1

require_test_type medium
require_fs_type any

setup

$Env:RESVSIZE="10M"

# prepare pool sets
create_poolset $DIR\testset1 `
	($Env:RESVSIZE + ":" + $DIR + "\testdir10:d")

expect_normal_exit $Env:EXE_DIR\obj_extend$Env:EXESUFFIX $DIR\testset1

check

pass
