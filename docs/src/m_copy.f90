module m_copy
  !! Contains routines to copy arrays to new memory locations while keeping both copies
  use variableKind
  use m_errors, only: mErr,eMsg
  use m_allocate, only: allocate

  private

  public copy
  interface copy
    !! Copy Array this to that, will allocate or reallocate the output array
    !!
    !! Example usage
    !!```fortran
    !!use variableKind
    !!use m_allocate
    !!use m_copy
    !!real(r64),allocatable :: a1D(:), a2D(:,:), a3D(:,:,:)
    !!real(r64),allocatable :: b1D(:), b2D(:,:), b3D(:,:,:)
    !!call allocate(a1D, 20)
    !!call allocate(a2D, [20,20])
    !!call allocate(a3D, [20,20,20])
    !!a1D = 1.d0
    !!a2D = 2.d0
    !!a3D = 3.d0
    !!call copy(a1D, b1D)
    !!call copy(a2D, b2D)
    !!call copy(a3D, b3D)
    !!write(*,'(a)') 'a1D equals b1D: '//str(all(a1D == b1D))
    !!write(*,'(a)') 'a2D equals b2D: '//str(all(a2D == b2D))
    !!write(*,'(a)') 'a3D equals b3D: '//str(all(a3D == b3D))
    !!```
    module procedure :: copy_r1D, copy_r2D, copy_r3D
    module procedure :: copy_d1D, copy_d2D, copy_d3D
    module procedure :: copy_i1D, copy_i2D, copy_i3D
    module procedure :: copy_id1D, copy_id2D, copy_id3D
    module procedure :: copy_c1D, copy_c2D, copy_c3D
    module procedure :: copy_z1D, copy_z2D, copy_z3D
    module procedure :: copy_l1D, copy_l2D, copy_l3D
  end interface

contains
  !====================================================================!
  module subroutine copy_r1D(this,that)
  !====================================================================!
    !! Interfaced with copy()
    real(r32), allocatable, intent(in) :: this(:) !! Copy this array
    real(r32), allocatable, intent(inout)  :: that(:) !! Copy of this
    if (.not. allocated(this)) call eMsg('copy_r1D:Array to be copied is not allocated')
    call allocate(that,size(this))
    that = this
  end subroutine
  !====================================================================!
  !====================================================================!
  module subroutine copy_r2D(this,that)
  !====================================================================!
    !! Interfaced with copy()
    real(r32), allocatable, intent(in) :: this(:,:) !! Copy this array
    real(r32), allocatable, intent(inout) :: that(:,:) !! Copy of this
    if (.not. allocated(this)) call eMsg('copy_r2D:Array to be copied is not allocated')
    call allocate(that,shape(this))
    that = this
  end subroutine
  !====================================================================!
  !====================================================================!
  module subroutine copy_r3D(this,that)
  !====================================================================!
    !! Interfaced with copy()
    real(r32), allocatable, intent(in) :: this(:,:,:) !! Copy this array
    real(r32), allocatable, intent(inout) :: that(:,:,:) !! Copy of this
    if (.not. allocated(this)) call eMsg('copy_r3D:Array to be copied is not allocated')
    call allocate(that,shape(this))
    that = this
  end subroutine
  !====================================================================!
  !====================================================================!
  module subroutine copy_d1D(this,that)
  !====================================================================!
    !! Interfaced with copy()
    real(r64), allocatable, intent(in) :: this(:) !! Copy this array
    real(r64), allocatable, intent(inout) :: that(:) !! Copy of this
    if (.not. allocated(this)) call eMsg('copy_d1D:Array to be copied is not allocated')
    call allocate(that,size(this))
    that = this
  end subroutine
  !====================================================================!
  !====================================================================!
  module subroutine copy_d2D(this,that)
  !====================================================================!
    !! Interfaced with copy()
    real(r64), allocatable, intent(in) :: this(:,:) !! Copy this array
    real(r64), allocatable, intent(inout) :: that(:,:) !! Copy of this
    if (.not. allocated(this)) call eMsg('copy_d2D:Array to be copied is not allocated')
    call allocate(that,shape(this))
    that = this
  end subroutine
  !====================================================================!
  !====================================================================!
  module subroutine copy_d3D(this,that)
  !====================================================================!
    !! Interfaced with copy()
    real(r64), allocatable, intent(in) :: this(:,:,:) !! Copy this array
    real(r64), allocatable, intent(inout) :: that(:,:,:) !! Copy of this
    if (.not. allocated(this)) call eMsg('copy_d3D:Array to be copied is not allocated')
    call allocate(that,shape(this))
    that = this
  end subroutine
  !====================================================================!
  !====================================================================!
  module subroutine copy_i1D(this,that)
  !====================================================================!
    !! Interfaced with copy()
    integer(i32), allocatable, intent(in) :: this(:) !! Copy this array
    integer(i32), allocatable, intent(inout) :: that(:) !! Copy of this
    if (.not. allocated(this)) call eMsg('copy_i1D:Array to be copied is not allocated')
    call allocate(that,size(this))
    that = this
  end subroutine
  !====================================================================!
  !====================================================================!
  module subroutine copy_i2D(this,that)
  !====================================================================!
    !! Interfaced with copy()
    integer(i32), allocatable, intent(in) :: this(:,:) !! Copy this array
    integer(i32), allocatable, intent(inout) :: that(:,:) !! Copy of this
    if (.not. allocated(this)) call eMsg('copy_i2D:Array to be copied is not allocated')
    call allocate(that,shape(this))
    that = this
  end subroutine
  !====================================================================!
  !====================================================================!
  module subroutine copy_i3D(this,that)
  !====================================================================!
    !! Interfaced with copy()
    integer(i32), allocatable, intent(in) :: this(:,:,:) !! Copy this array
    integer(i32), allocatable, intent(inout) :: that(:,:,:) !! Copy of this
    if (.not. allocated(this)) call eMsg('copy_i3D:Array to be copied is not allocated')
    call allocate(that,shape(this))
    that = this
  end subroutine
  !====================================================================!
  !====================================================================!
  module subroutine copy_id1D(this,that)
  !====================================================================!
    !! Interfaced with copy()
    integer(i64), allocatable, intent(in) :: this(:) !! Copy this array
    integer(i64), allocatable, intent(inout) :: that(:) !! Copy of this
    if (.not. allocated(this)) call eMsg('copy_id1D:Array to be copied is not allocated')
    call allocate(that,size(this))
    that = this
  end subroutine
  !====================================================================!
  !====================================================================!
  module subroutine copy_id2D(this,that)
  !====================================================================!
    !! Interfaced with copy()
    integer(i64), allocatable, intent(in) :: this(:,:) !! Copy this array
    integer(i64), allocatable, intent(inout) :: that(:,:) !! Copy of this
    if (.not. allocated(this)) call eMsg('copy_id2D:Array to be copied is not allocated')
    call allocate(that,shape(this))
    that = this
  end subroutine
  !====================================================================!
  !====================================================================!
  module subroutine copy_id3D(this,that)
  !====================================================================!
    !! Interfaced with copy()
    integer(i64), allocatable, intent(in) :: this(:,:,:) !! Copy this array
    integer(i64), allocatable, intent(inout) :: that(:,:,:) !! Copy of this
    if (.not. allocated(this)) call eMsg('copy_id3D:Array to be copied is not allocated')
    call allocate(that,shape(this))
    that = this
  end subroutine
  !====================================================================!
  !====================================================================!
  module subroutine copy_c1D(this,that)
  !====================================================================!
    !! Interfaced with copy()
    complex(r32), allocatable, intent(in) :: this(:) !! Copy this array
    complex(r32), allocatable, intent(inout)  :: that(:) !! Copy of this
    if (.not. allocated(this)) call eMsg('copy_c1D:Array to be copied is not allocated')
    call allocate(that,size(this))
    that = this
  end subroutine
  !====================================================================!
  !====================================================================!
  module subroutine copy_c2D(this,that)
  !====================================================================!
    !! Interfaced with copy()
    complex(r32), allocatable, intent(in) :: this(:,:) !! Copy this array
    complex(r32), allocatable, intent(inout) :: that(:,:) !! Copy of this
    if (.not. allocated(this)) call eMsg('copy_c2D:Array to be copied is not allocated')
    call allocate(that,shape(this))
    that = this
  end subroutine
  !====================================================================!
  !====================================================================!
  module subroutine copy_c3D(this,that)
  !====================================================================!
    !! Interfaced with copy()
    complex(r32), allocatable, intent(in) :: this(:,:,:) !! Copy this array
    complex(r32), allocatable, intent(inout) :: that(:,:,:) !! Copy of this
    if (.not. allocated(this)) call eMsg('copy_c3D:Array to be copied is not allocated')
    call allocate(that,shape(this))
    that = this
  end subroutine
  !====================================================================!
  !====================================================================!
  module subroutine copy_z1D(this,that)
  !====================================================================!
    !! Interfaced with copy()
    complex(r64), allocatable, intent(in) :: this(:) !! Copy this array
    complex(r64), allocatable, intent(inout)  :: that(:) !! Copy of this
    if (.not. allocated(this)) call eMsg('copy_z1D:Array to be copied is not allocated')
    call allocate(that,size(this))
    that = this
  end subroutine
  !====================================================================!
  !====================================================================!
  module subroutine copy_z2D(this,that)
  !====================================================================!
    !! Interfaced with copy()
    complex(r64), allocatable, intent(in) :: this(:,:) !! Copy this array
    complex(r64), allocatable, intent(inout) :: that(:,:) !! Copy of this
    if (.not. allocated(this)) call eMsg('copy_z2D:Array to be copied is not allocated')
    call allocate(that,shape(this))
    that = this
  end subroutine
  !====================================================================!
  !====================================================================!
  module subroutine copy_z3D(this,that)
  !====================================================================!
    !! Interfaced with copy()
    complex(r64), allocatable, intent(in) :: this(:,:,:) !! Copy this array
    complex(r64), allocatable, intent(inout) :: that(:,:,:) !! Copy of this
    if (.not. allocated(this)) call eMsg('copy_z3D:Array to be copied is not allocated')
    call allocate(that,shape(this))
    that = this
  end subroutine
  !====================================================================!
  !====================================================================!
  module subroutine copy_l1D(this,that)
  !====================================================================!
    !! Interfaced with copy()
    logical, allocatable, intent(in) :: this(:) !! Copy this array
    logical, allocatable, intent(inout)  :: that(:) !! Copy of this
    if (.not. allocated(this)) call eMsg('copy_l1D:Array to be copied is not allocated')
    call allocate(that,size(this))
    that = this
  end subroutine
  !====================================================================!
  !====================================================================!
  module subroutine copy_l2D(this,that)
  !====================================================================!
    !! Interfaced with copy()
    logical, allocatable, intent(in) :: this(:,:) !! Copy this array
    logical, allocatable, intent(inout) :: that(:,:) !! Copy of this
    if (.not. allocated(this)) call eMsg('copy_l2D:Array to be copied is not allocated')
    call allocate(that,shape(this))
    that = this
  end subroutine
  !====================================================================!
  !====================================================================!
  module subroutine copy_l3D(this,that)
  !====================================================================!
    !! Interfaced with copy()
    logical, allocatable, intent(in) :: this(:,:,:) !! Copy this array
    logical, allocatable, intent(inout) :: that(:,:,:) !! Copy of this
    if (.not. allocated(this)) call eMsg('copy_l3D:Array to be copied is not allocated')
    call allocate(that,shape(this))
    that = this
  end subroutine
  !====================================================================!
end module
