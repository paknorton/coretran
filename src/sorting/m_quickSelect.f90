module m_quickSelect
  !! Perform a quickselect on an array. Quick select finds the kth smallest number in an array. It also puts values lower than the kth on the left, and those higher on the right
  !! This makes it perfect for finding the median.
  use variableKind
  use m_swap, only: swap
  use m_medianOf3, only: medianOf3, argMedianOf3
  use m_partition, only: partition, argPartition
  use m_sort, only: insertionSort, argInsertionSort
  implicit none

  private

  public quickSelect
  interface quickSelect
    !! Find the kth smallest element in an array
    module procedure :: quickSelect_r1D, quickSelect_d1D, quickSelect_i1D, quickSelect_id1D
  end interface

  public argQuickSelect
  interface argQuickSelect
    !! Find the kth smallest element in an array without modifying the array, instead the indices into that array are modified
    module procedure :: argQuickselect_r1D, argQuickSelect_d1D, argQuickSelect_i1D, argQuickSelect_id1D
  end interface

  contains
  !====================================================================!
  function quickSelect_r1D(this, k) result(res)
    !! Interfaced with quickselect()
  !====================================================================!
    real(r32), intent(inout) :: this(:) !! 1D array
    integer(i32), intent(in) :: k !! kth smallest element to find
    real(r32) :: res !! kth element
    integer(i32) :: hi
    integer(i32) :: j
    integer(i32) :: lo
    integer(i32) :: mid

    lo = 1
    hi = size(this)

    do while (hi > lo)
      if (hi - lo < 16) then
        call insertionSort(this, lo, hi)
        res = this(k)
        return
      end if
      mid = (hi+lo)/2
      call medianOf3(this, lo, mid, hi)
      call swap(this(lo), this(mid))
      call partition(this, lo, hi, j)
      ! Found the kth value, exit
      if (j == k) then
        res = this(k)
        return
      end if
      if (j < k) then
        lo = j + 1
      elseif (j > k) then
        hi = j - 1
      end if
    end do
  end function
  !====================================================================!
  !====================================================================!
  function quickSelect_d1D(this, k) result(res)
    !! Interfaced with quickselect()
  !====================================================================!
    real(r64), intent(inout) :: this(:) !! 1D array
    integer(i32), intent(in) :: k !! kth smallest element to find
    real(r64) :: res !! kth element
    integer(i32) :: hi
    integer(i32) :: j
    integer(i32) :: lo
    integer(i32) :: mid

    lo = 1
    hi = size(this)

    do while (hi > lo)
      if (hi - lo < 16) then
        call insertionSort(this, lo, hi)
        res = this(k)
        return
      end if
      mid = (hi+lo)/2
      call medianOf3(this, lo, mid, hi)
      call swap(this(lo), this(mid))
      call partition(this, lo, hi, j)
      ! Found the kth value, exit
      if (j == k) then
        res = this(k)
        return
      end if
      if (j < k) then
        lo = j + 1
      elseif (j > k) then
        hi = j - 1
      end if
    end do
  end function
  !====================================================================!
  !====================================================================!
  function quickSelect_i1D(this, k) result(res)
    !! Interfaced with quickselect()
  !====================================================================!
    integer(i32), intent(inout) :: this(:) !! 1D array
    integer(i32), intent(in) :: k !! kth smallest element to find
    integer(i32) :: res !! kth element
    integer(i32) :: hi
    integer(i32) :: j
    integer(i32) :: lo
    integer(i32) :: mid

    lo = 1
    hi = size(this)

    do while (hi > lo)
      if (hi - lo < 16) then
        call insertionSort(this, lo, hi)
        res = this(k)
        return
      end if
      mid = (hi+lo)/2
      call medianOf3(this, lo, mid, hi)
      call swap(this(lo), this(mid))
      call partition(this, lo, hi, j)
      ! Found the kth value, exit
      if (j == k) then
        res = this(k)
        return
      end if
      if (j < k) then
        lo = j + 1
      elseif (j > k) then
        hi = j - 1
      end if
    end do
  end function
  !====================================================================!
  !====================================================================!
  function quickSelect_id1D(this, k) result(res)
    !! Interfaced with quickselect()
  !====================================================================!
    integer(i64), intent(inout) :: this(:) !! 1D array
    integer(i32), intent(in) :: k !! kth smallest element to find
    integer(i64) :: res !! kth element
    integer(i32) :: hi
    integer(i32) :: j
    integer(i32) :: lo
    integer(i32) :: mid

    lo = 1
    hi = size(this)

    do while (hi > lo)
      if (hi - lo < 16) then
        call insertionSort(this, lo, hi)
        res = this(k)
        return
      end if
      mid = (hi+lo)/2
      call medianOf3(this, lo, mid, hi)
      call swap(this(lo), this(mid))
      call partition(this, lo, hi, j)
      ! Found the kth value, exit
      if (j == k) then
        res = this(k)
        return
      end if
      if (j < k) then
        lo = j + 1
      elseif (j > k) then
        hi = j - 1
      end if
    end do
  end function
  !====================================================================!
  !====================================================================!
  function argQuickselect_r1D(this, indx, k) result(res)
    !! Interfaced with argQuickselect()
  !====================================================================!
    real(r32), intent(in) :: this(:) !! 1D array
    integer(i32), intent(inout) :: indx(:) !! Index into array
    integer(i32), intent(in) :: k !! kth smallest element to find
    real(r32) :: res !! kth element
    integer(i32) :: hi
    integer(i32) :: j
    integer(i32) :: lo
    integer(i32) :: mid

    lo = 1
    hi = size(this)

    do while (hi > lo)
      if (hi - lo < 16) then
        call argInsertionSort(this, indx, lo, hi)
        res = this(indx(k))
        return
      end if
      mid = (hi+lo)/2
      call argMedianOf3(this, indx, lo, mid, hi)
      call swap(indx(lo), indx(mid))
      call argPartition(this, indx, lo, hi, j)
      ! Found the kth value, exit
      if (j == k) then
        res = this(indx(k))
        return
      end if
      if (j < k) then
        lo = j + 1
      elseif (j > k) then
        hi = j - 1
      end if
    end do
  end function
  !====================================================================!
  !====================================================================!
  function argQuickselect_d1D(this, indx, k) result(res)
    !! Interfaced with argQuickselect()
  !====================================================================!
    real(r64), intent(in) :: this(:) !! 1D array
    integer(i32), intent(inout) :: indx(:) !! Index into array
    integer(i32), intent(in) :: k !! kth smallest element to find
    real(r64) :: res !! kth element
    integer(i32) :: hi
    integer(i32) :: j
    integer(i32) :: lo
    integer(i32) :: mid

    lo = 1
    hi = size(this)

    do while (hi > lo)
      if (hi - lo < 16) then
        call argInsertionSort(this, indx, lo, hi)
        res = this(indx(k))
        return
      end if
      mid = (hi+lo)/2
      call argMedianOf3(this, indx, lo, mid, hi)
      call swap(indx(lo), indx(mid))
      call argPartition(this, indx, lo, hi, j)
      ! Found the kth value, exit
      if (j == k) then
        res = this(indx(k))
        return
      end if
      if (j < k) then
        lo = j + 1
      elseif (j > k) then
        hi = j - 1
      end if
    end do
  end function
  !====================================================================!
  !====================================================================!
  function argQuickselect_i1D(this, indx, k) result(res)
    !! Interfaced with argQuickselect()
  !====================================================================!
    integer(i32), intent(in) :: this(:) !! 1D array
    integer(i32), intent(inout) :: indx(:) !! Index into array
    integer(i32), intent(in) :: k !! kth smallest element to find
    integer(i32) :: res !! kth element
    integer(i32) :: hi
    integer(i32) :: j
    integer(i32) :: lo
    integer(i32) :: mid

    lo = 1
    hi = size(this)

    do while (hi > lo)
      if (hi - lo < 16) then
        call argInsertionSort(this, indx, lo, hi)
        res = this(indx(k))
        return
      end if
      mid = (hi+lo)/2
      call argMedianOf3(this, indx, lo, mid, hi)
      call swap(indx(lo), indx(mid))
      call argPartition(this, indx, lo, hi, j)
      ! Found the kth value, exit
      if (j == k) then
        res = this(indx(k))
        return
      end if
      if (j < k) then
        lo = j + 1
      elseif (j > k) then
        hi = j - 1
      end if
    end do
  end function
  !====================================================================!
  !====================================================================!
  function argQuickselect_id1D(this, indx, k) result(res)
    !! Interfaced with argQuickselect()
  !====================================================================!
    integer(i64), intent(in) :: this(:) !! 1D array
    integer(i32), intent(inout) :: indx(:) !! Index into array
    integer(i32), intent(in) :: k !! kth smallest element to find
    integer(i64) :: res !! kth element
    integer(i32) :: hi
    integer(i32) :: j
    integer(i32) :: lo
    integer(i32) :: mid

    lo = 1
    hi = size(this)

    do while (hi > lo)
      if (hi - lo < 16) then
        call argInsertionSort(this, indx, lo, hi)
        res = this(indx(k))
        return
      end if
      mid = (hi+lo)/2
      call argMedianOf3(this, indx, lo, mid, hi)
      call swap(indx(lo), indx(mid))
      call argPartition(this, indx, lo, hi, j)
      ! Found the kth value, exit
      if (j == k) then
        res = this(indx(k))
        return
      end if
      if (j < k) then
        lo = j + 1
      elseif (j > k) then
        hi = j - 1
      end if
    end do
  end function
  !====================================================================!
end module