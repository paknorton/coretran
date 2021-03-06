submodule (m_maths) sm_maths_r1d
  !! Implement math routines for double precision arrays
implicit none

contains
  !====================================================================!
  module function crossproduct_r1D(a,b) result(res)
  !! Interfaced with crossproduct()
  !====================================================================!
  real(r32), intent(in) :: a(3) !! 1D Array
  real(r32), intent(in) :: b(3) !! 1D Array
  real(r32) :: res(3) !! cross product
  res(1)=a(2)*b(3)-a(3)*b(2)
  res(2)=a(3)*b(1)-a(1)*b(3)
  res(3)=a(1)*b(2)-a(2)*b(1)
  end function
  !====================================================================!
  !====================================================================!
  module function cumprod_r1D(this) result(res)
    !! Interfaced with cumprod()
  !====================================================================!
  real(r32),intent(in) :: this(:) !! 1D array
  real(r32) :: res(size(this)) !! Cumulative product
  integer(i32) :: i
  integer(i32) :: N
  N=size(this)
  res(1) = this(1)
  do i=2,N
    res(i) = res(i-1) * this(i)
  end do
  end function
  !====================================================================!
  !====================================================================!
  module function cumsum_r1D(this) result(res)
    !! Interfaced with cumsum()
  !====================================================================!
  real(r32), intent(in) :: this(:) !! 1D array
  real(r32) :: res(size(this)) !! Cumulative sum
  integer(i32) :: i
  integer(i32) :: N
  N=size(this)
  res(1) = this(1)
  do i=2,N
    res(i) = res(i-1) + this(i)  ! Round off error?
  end do
  end function
  !====================================================================!
  !====================================================================!
  module function fastTwoDiff_r(a,b) result(res)
    !! Interfaced with fastTwoDiff()
  !====================================================================!
    real(r32), intent(in) :: a !! First number
    real(r32), intent(in) :: b !! Second number
    real(r32) :: res(2) !! Result and its error
    real(r32) :: bVirtual
    res(1) = a - b
    bVirtual = a - res(1)
    res(2) = bVirtual - b
  end function
  !====================================================================!
  !====================================================================!
  module function fastTwoSum_r(a,b) result(res)
    !! Interfaced with fastTwoSum()
  !====================================================================!
    real(r32), intent(in) :: a !! First number
    real(r32), intent(in) :: b !! Second number
    real(r32) :: res(2) !! Result and its error
    real(r32) :: bVirtual
    res(1) = a + b
    bVirtual = res(1) - a
    res(2) = b - bVirtual
  end function
  !====================================================================!
  !====================================================================!
  module function geometricMean_r1D(this) result(res)
    !! Interfaced with geometricMean()
  !====================================================================!
  real(r32),intent(in) :: this(:)
  real(r64) :: res
  res=product(this)
  res=res**(dble(size(this)))
  end function
  !====================================================================!
  !====================================================================!
  module procedure Mean_r1D
    !! interface with mean()
  !====================================================================!
  !module function mean_r1D(this) result(res)
  !real(r32) :: this(:)
  !real(r64) :: res
  res=sum(dble(this))/(dble(size(this)))
  end procedure
  !====================================================================!
  !====================================================================!
  module function median_r1D(this) result(res)
  !====================================================================!
    !! Interfaced with median()
  real(r32), intent(in) :: this(:) !! 1D array
  real(r32) :: res !! median
  integer(i32), allocatable :: i(:)
  integer(i32) :: iMed
  integer(i32) :: N

  integer(i32) :: iTmp

  N=size(this)
  call allocate(i,N)
  call arange(i,1,N)

  if (mod(N,2)==0) then
    iMed = N/2
    call argSelect(this, i, iMed, iTmp)
    res=this(iTmp)
    call arange(i,1,N)
    call argSelect(this, i, iMed+1, iTmp)
    res=0.5*(res+this(iTmp))
  else
    iMed=N/2 + 1
    call argSelect(this, i, iMed, iTmp)
    res = this(iTmp)
  end if

  deallocate(i)
  end function
  !====================================================================!
  !====================================================================!
  module procedure norm1_r1D
    !! interface with norm1()
  !====================================================================!
  !module function norm1_d1D(this) result(res)
  !real(r32) :: this(:)
  !real(r32) :: res
  res=sum(abs(this))
  end procedure
  !====================================================================!
  !====================================================================!
  module procedure normI_r1D
    !! interface with normI()
  !====================================================================!
  !module function normI_d1D(this) result(res)
  !real(r32) :: this(:)
  !real(r32) :: res
  res=maxval(abs(this))
  end procedure
  !====================================================================!
  !====================================================================!
  module function project_r1D(a,b) result(c)
    !! Interfaced with project()
  !====================================================================!
  real(r32), intent(in) :: a(:) !! 1D array
  real(r32), intent(in) :: b(size(a)) !! 1D array
  real(r32) :: c(size(a)) !! 1D array
!  real(r64) :: c1
  ! Normalize b
!  c1=norm2(b)**2.d0
!  if (c1 == 0.0) then
!    c=0.d0
!    return
!  end if
!  c=b/c1
!  ! Dot a onto b hat
!  c1=dot_product(a,b)
!  ! Multiply projected length by b hat
!  c=c1*c
  c = real(project(dble(a),dble(b)), kind=r32)
  end function
  !====================================================================!

  !====================================================================!
  module procedure trimmedmean_r1D
    !! Interfaced with trimmedmean()
  !====================================================================!
  !function trimmedmean_r1D(this,alpha) result(res)
  !real(r32) :: this(:)
  !real(r64) :: alpha
  !real(r64) :: res
  integer(i32) :: istat
  integer(i32) :: j
  integer(i32) :: N
  integer(i32) :: tmp
  integer(i32), allocatable :: i(:)
  real(r32) :: alpha_

  real(r32), allocatable :: rTmp(:)

  N=size(this)
  alpha_=alpha*0.01
  ! Test the percentage
  if (alpha_ <= 0.0) then
    res=Mean(this)
    return
  elseif (alpha_ >= 0.5) then
    call eMsg('trimmedmean:alpha >= 50% does not make sense')
  endif
  ! Calculate the number of integers that make up the trimmed percentage
  tmp=idnint(alpha_*dble(N))

  ! Set the indices into the vector
  call allocate(i, N)
  call arange(i, 1, N)

  ! Sort the vector
  call argSort(this,i)

  call allocate(rTmp, N-(2*tmp))
  rTmp =this(i(tmp+1:N-tmp))
  res=mean(rTmp)
  call deallocate(i)
  call deallocate(rTmp)

  end procedure
  !====================================================================!

  !====================================================================!
  module function twoDiff_r(a,b) result(res)
  !====================================================================!
    !! Interfaced with twoDiff()
  real(r32), intent(in) :: a !! First number
  real(r32), intent(in) :: b !! Second number
  real(r32) :: res(2) !! Result and its error
  real(r32) :: aVirtual, bVirtual
  real(r32) :: aRoundoff, bRoundoff
  res(1) = a - b
  bVirtual = a - res(1)
  aVirtual = res(1) + bVirtual
  bRoundoff = bVirtual - b
  aRoundoff = a - aVirtual
  res(2) = aRoundoff + bRoundoff
  end function
  !====================================================================!
  !====================================================================!
  module function twoSum_r(a,b) result(res)
    !! Interfaced with twoSum()
  !====================================================================!
  real(r32), intent(in) :: a !! First number in sum
  real(r32), intent(in) :: b !! Second number in sum
  real(r32) :: res(2) !! The sum and its error
  real(r32) :: aVirtual, bVirtual
  real(r32) :: aRoundoff, bRoundoff
  res(1) = a + b
  bVirtual = res(1) - a
  aVirtual = res(1) - bVirtual
  bRoundoff = b - bVirtual
  aRoundoff = a - aVirtual
  res(2) = aRoundoff + bRoundoff
  end function
  !====================================================================!
  !====================================================================!
  module procedure std_r1D
    !! Interfaced with std()
  !====================================================================!
  !real(r32) :: this(:)
  !real(r64) :: res
  res=dsqrt(Variance(this))
  end procedure
  !====================================================================!
  !====================================================================!
  module procedure Variance_r1D
    !! Interfaced with variance()
  !====================================================================!
  !real(r32) :: this(:)
  !real(r64) :: res
  real(r64) :: tmp
  tmp=Mean(this)
  res=sum(dble(this-tmp)**2.d0)/dble(size(this)-1)
  end procedure
  !====================================================================!
end submodule
