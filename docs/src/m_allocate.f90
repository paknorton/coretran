module m_allocate
  !! Contains fundamental routines to allocate allocatable arrays of different types and shapes
  !! Does not overload the intrinsic allocate function.
  !!
  !! This way, calling allocate makes the user aware that checks are being made, and memory will be re-allocated.

  use variableKind
  use m_errors, only: eMsg,mErr

  implicit none

  private

  public allocate

  interface allocate
    !! Allocate an allocatable array. If the array is already allocated, memory is reallocated to the given size, unless no size change will occur.
    !! The allocated memory is NOT initialized to any value, so be sure to do so if you call allocate
    !!
    !! Example usage
    !!```fortran
    !!use variableKind
    !!use m_allocate, only: allocate
    !!real(r64),allocatable :: a1D(:), a2D(:,:), a3D(:,:,:)
    !!call allocate(a1D, 20)
    !!call allocate(a2D, [20,20])
    !!call allocate(a3D, [20,20,20])
    !!write(*,'(a)') 'Shape of a3D is [20,20,20]? '//all(shape(a3D) == [20,20,20])
    !!```
    module procedure :: allocate_r1D, allocate_r2D, allocate_r3D
    module procedure :: allocate_d1D, allocate_d2D, allocate_d3D
    module procedure :: allocate_i1D, allocate_i2D, allocate_i3D
    module procedure :: allocate_id1D, allocate_id2D, allocate_id3D
    module procedure :: allocate_c1D, allocate_c2D, allocate_c3D
    module procedure :: allocate_z1D, allocate_z2D, allocate_z3D
    module procedure :: allocate_l1D, allocate_l2D, allocate_l3D
  end interface

  contains

  !====================================================================!
  subroutine allocate_r1D(this, n)
    !! Interfaced with allocate()
  !====================================================================!
    real(r32), allocatable, intent(inout) :: this(:) !! 1D array
    integer(i32), intent(in) :: n !! Allocation size
    integer(i32) :: istat

    if(allocated(this)) then
      if (n == size(this)) then
        return ! Don't need to allocate the same size
      else
        deallocate(this) ! No need to duplicate memory
      end if
    end if
    allocate(this(n), stat=istat); call mErr(istat,'allocate_r1D:this',1)
  end subroutine
  !====================================================================!
  !====================================================================!
  subroutine allocate_r2D(this, n)
    !! Interfaced with allocate()
  !====================================================================!
    real(r32), allocatable, intent(inout) :: this(:,:) !! 2D array
    integer(i32), intent(in) :: n(2) !! New allocation shape
    integer(i32) :: istat

    if(allocated(this)) then
      if (all(n == shape(this))) then
        return ! Don't need to allocate the same size
      else
        deallocate(this)
      end if
    end if
    allocate(this(n(1),n(2)), stat=istat); call mErr(istat,'allocate_r2D:this',1)
  end subroutine
  !====================================================================!
  !====================================================================!
  subroutine allocate_r3D(this, n)
    !! Interfaced with allocate()
  !====================================================================!
    real(r32), allocatable, intent(inout) :: this(:,:,:) !! 3D array
    integer(i32), intent(in) :: n(3) !! New allocation shape
    integer(i32) :: istat

    if(allocated(this)) then
      if (all(n == shape(this))) then
        return ! Don't need to allocate the same size
      else
        deallocate(this)
      end if
    end if
    allocate(this(n(1),n(2),n(3)), stat=istat); call mErr(istat,'allocate_r3D:this',1)
  end subroutine
  !====================================================================!
  !====================================================================!
  subroutine allocate_d1D(this, n)
    !! Interfaced with allocate()
  !====================================================================!
    real(r64), allocatable, intent(inout) :: this(:) !! 1D array
    integer(i32), intent(in) :: n !! Allocation size
    integer(i32) :: istat

    if(allocated(this)) then
      if (n == size(this)) then
        return ! Don't need to allocate the same size
      else
        deallocate(this) ! No need to duplicate memory
      end if
    end if
    allocate(this(n), stat=istat); call mErr(istat,'allocate_d1D:this',1)
  end subroutine
  !====================================================================!
  !====================================================================!
  subroutine allocate_d2D(this, n)
    !! Interfaced with allocate()
  !====================================================================!
    real(r64), allocatable, intent(inout) :: this(:,:) !! 2D array
    integer(i32), intent(in) :: n(2) !! New allocation shape
    integer(i32) :: istat

    if(allocated(this)) then
      if (all(n == shape(this))) then
        return ! Don't need to allocate the same size
      else
        deallocate(this)
      end if
    end if
    allocate(this(n(1),n(2)), stat=istat); call mErr(istat,'allocate_d2D:this',1)
  end subroutine
  !====================================================================!
  !====================================================================!
  subroutine allocate_d3D(this, n)
    !! Interfaced with allocate()
  !====================================================================!
    real(r64), allocatable, intent(inout) :: this(:,:,:) !! 3D array
    integer(i32), intent(in) :: n(3) !! New allocation shape
    integer(i32) :: istat

    if(allocated(this)) then
      if (all(n == shape(this))) then
        return ! Don't need to allocate the same size
      else
        deallocate(this)
      end if
    end if
    allocate(this(n(1),n(2),n(3)), stat=istat); call mErr(istat,'allocate_d3D:this',1)
  end subroutine
  !====================================================================!
  !====================================================================!
  subroutine allocate_i1D(this, n)
    !! Interfaced with allocate()
  !====================================================================!
    integer(i32), allocatable, intent(inout) :: this(:) !! 1D array
    integer(i32), intent(in) :: n !! Allocation size
    integer(i32) :: istat

    if(allocated(this)) then
      if (n == size(this)) then
        return ! Don't need to allocate the same size
      else
        deallocate(this) ! No need to duplicate memory
      end if
    end if
    allocate(this(n), stat=istat); call mErr(istat,'allocate_i1D:this',1)
  end subroutine
  !====================================================================!
  !====================================================================!
  subroutine allocate_i2D(this, n)
    !! Interfaced with allocate()
  !====================================================================!
    integer(i32), allocatable, intent(inout) :: this(:,:) !! 2D array
    integer(i32), intent(in) :: n(2) !! New allocation shape
    integer(i32) :: istat

    if(allocated(this)) then
      if (all(n == shape(this))) then
        return ! Don't need to allocate the same size
      else
        deallocate(this)
      end if
    end if
    allocate(this(n(1),n(2)), stat=istat); call mErr(istat,'allocate_i2D:this',1)
  end subroutine
  !====================================================================!
  !====================================================================!
  subroutine allocate_i3D(this, n)
    !! Interfaced with allocate()
  !====================================================================!
    integer(i32), allocatable, intent(inout) :: this(:,:,:) !! 3D array
    integer(i32), intent(in) :: n(3) !! New allocation shape
    integer(i32) :: istat

    if(allocated(this)) then
      if (all(n == shape(this))) then
        return ! Don't need to allocate the same size
      else
        deallocate(this)
      end if
    end if
    allocate(this(n(1),n(2),n(3)), stat=istat); call mErr(istat,'allocate_i3D:this',1)
  end subroutine
  !====================================================================!
    !====================================================================!
  subroutine allocate_id1D(this, n)
    !! Interfaced with allocate()
  !====================================================================!
    integer(i64), allocatable, intent(inout) :: this(:) !! 1D array
    integer(i32), intent(in) :: n !! Allocation size
    integer(i32) :: istat

    if(allocated(this)) then
      if (n == size(this)) then
        return ! Don't need to allocate the same size
      else
        deallocate(this) ! No need to duplicate memory
      end if
    end if
    allocate(this(n), stat=istat); call mErr(istat,'allocate_id1D:this',1)
  end subroutine
  !====================================================================!
  !====================================================================!
  subroutine allocate_id2D(this, n)
    !! Interfaced with allocate()
  !====================================================================!
    integer(i64), allocatable, intent(inout) :: this(:,:) !! 2D array
    integer(i32), intent(in) :: n(2) !! New allocation shape
    integer(i32) :: istat

    if(allocated(this)) then
      if (all(n == shape(this))) then
        return ! Don't need to allocate the same size
      else
        deallocate(this)
      end if
    end if
    allocate(this(n(1),n(2)), stat=istat); call mErr(istat,'allocate_id2D:this',1)
  end subroutine
  !====================================================================!
  !====================================================================!
  subroutine allocate_id3D(this, n)
    !! Interfaced with allocate()
  !====================================================================!
    integer(i64), allocatable, intent(inout) :: this(:,:,:) !! 3D array
    integer(i32), intent(in) :: n(3) !! New allocation shape
    integer(i32) :: istat

    if(allocated(this)) then
      if (all(n == shape(this))) then
        return ! Don't need to allocate the same size
      else
        deallocate(this)
      end if
    end if
    allocate(this(n(1),n(2),n(3)), stat=istat); call mErr(istat,'allocate_id3D:this',1)
  end subroutine
  !====================================================================!
  !====================================================================!
  subroutine allocate_c1D(this, n)
    !! Interfaced with allocate()
  !====================================================================!
    complex(r32), allocatable, intent(inout) :: this(:) !! 1D array
    integer(i32), intent(in) :: n !! Allocation size
    integer(i32) :: istat

    if(allocated(this)) then
      if (n == size(this)) then
        return ! Don't need to allocate the same size
      else
        deallocate(this) ! No need to duplicate memory
      end if
    end if
    allocate(this(n), stat=istat); call mErr(istat,'allocate_c1D:this',1)
  end subroutine
  !====================================================================!
  !====================================================================!
  subroutine allocate_c2D(this, n)
    !! Interfaced with allocate()
  !====================================================================!
    complex(r32), allocatable, intent(inout) :: this(:,:) !! 2D array
    integer(i32), intent(in) :: n(2) !! New allocation shape
    integer(i32) :: istat

    if(allocated(this)) then
      if (all(n == shape(this))) then
        return ! Don't need to allocate the same size
      else
        deallocate(this)
      end if
    end if
    allocate(this(n(1),n(2)), stat=istat); call mErr(istat,'allocate_c2D:this',1)
  end subroutine
  !====================================================================!
  !====================================================================!
  subroutine allocate_c3D(this, n)
    !! Interfaced with allocate()
  !====================================================================!
    complex(r32), allocatable, intent(inout) :: this(:,:,:) !! 3D array
    integer(i32), intent(in) :: n(3) !! New allocation shape
    integer(i32) :: istat

    if(allocated(this)) then
      if (all(n == shape(this))) then
        return ! Don't need to allocate the same size
      else
        deallocate(this)
      end if
    end if
    allocate(this(n(1),n(2),n(3)), stat=istat); call mErr(istat,'allocate_c3D:this',1)
  end subroutine
  !====================================================================!
  !====================================================================!
  subroutine allocate_z1D(this, n)
    !! Interfaced with allocate()
  !====================================================================!
    complex(r64), allocatable, intent(inout) :: this(:) !! 1D array
    integer(i32), intent(in) :: n !! Allocation size
    integer(i32) :: istat

    if(allocated(this)) then
      if (n == size(this)) then
        return ! Don't need to allocate the same size
      else
        deallocate(this) ! No need to duplicate memory
      end if
    end if
    allocate(this(n), stat=istat); call mErr(istat,'allocate_z1D:this',1)
  end subroutine
  !====================================================================!
  !====================================================================!
  subroutine allocate_z2D(this, n)
    !! Interfaced with allocate()
  !====================================================================!
    complex(r64), allocatable, intent(inout) :: this(:,:) !! 2D array
    integer(i32), intent(in) :: n(2) !! New allocation shape
    integer(i32) :: istat

    if(allocated(this)) then
      if (all(n == shape(this))) then
        return ! Don't need to allocate the same size
      else
        deallocate(this)
      end if
    end if
    allocate(this(n(1),n(2)), stat=istat); call mErr(istat,'allocate_z2D:this',1)
  end subroutine
  !====================================================================!
  !====================================================================!
  subroutine allocate_z3D(this, n)
    !! Interfaced with allocate()
  !====================================================================!
    complex(r64), allocatable, intent(inout) :: this(:,:,:) !! 3D array
    integer(i32), intent(in) :: n(3) !! New allocation shape
    integer(i32) :: istat

    if(allocated(this)) then
      if (all(n == shape(this))) then
        return ! Don't need to allocate the same size
      else
        deallocate(this)
      end if
    end if
    allocate(this(n(1),n(2),n(3)), stat=istat); call mErr(istat,'allocate_z3D:this',1)
  end subroutine
  !====================================================================!
  !====================================================================!
  subroutine allocate_l1D(this, n)
    !! Interfaced with allocate()
  !====================================================================!
    logical, allocatable, intent(inout) :: this(:) !! 1D array
    integer(i32), intent(in) :: n !! Allocation size
    integer(i32) :: istat

    if(allocated(this)) then
      if (n == size(this)) then
        return ! Don't need to allocate the same size
      else
        deallocate(this) ! No need to duplicate memory
      end if
    end if
    allocate(this(n), stat=istat); call mErr(istat,'allocate_l1D:this',1)
  end subroutine
  !====================================================================!
  !====================================================================!
  subroutine allocate_l2D(this, n)
    !! Interfaced with allocate()
  !====================================================================!
    logical, allocatable, intent(inout) :: this(:,:) !! 2D array
    integer(i32), intent(in) :: n(2) !! New allocation shape
    integer(i32) :: istat

    if(allocated(this)) then
      if (all(n == shape(this))) then
        return ! Don't need to allocate the same size
      else
        deallocate(this)
      end if
    end if
    allocate(this(n(1),n(2)), stat=istat); call mErr(istat,'allocate_l2D:this',1)
  end subroutine
  !====================================================================!
  !====================================================================!
  subroutine allocate_l3D(this, n)
    !! Interfaced with allocate()
  !====================================================================!
    logical, allocatable, intent(inout) :: this(:,:,:) !! 3D array
    integer(i32), intent(in) :: n(3) !! New allocation shape
    integer(i32) :: istat

    if(allocated(this)) then
      if (all(n == shape(this))) then
        return ! Don't need to allocate the same size
      else
        deallocate(this)
      end if
    end if
    allocate(this(n(1),n(2),n(3)), stat=istat); call mErr(istat,'allocate_l3D:this',1)
  end subroutine
  !====================================================================!
end module
