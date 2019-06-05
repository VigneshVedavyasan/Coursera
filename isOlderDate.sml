
fun is_older (dt1 : int * int * int, dt2 : int * int * int) =
  if (#1 dt1) < (#1 dt2)
  then true
  else if (#1 dt1) = (#1 dt2)
       then if (#2 dt1) < (#2 dt2)
            then true
            else if (#2 dt1) = (#2 dt2)
                 then if (#3 dt1) < (#3 dt2)
                      then true
                      else false
                 else false
       else false

fun validate_date(date : (int * int * int)) =
  if ((#2 date) = 1 orelse (#2 date) = 3 orelse (#2 date) = 5 orelse (#2 date) = 7 orelse (#2 date) = 8 orelse (#2 date) = 10 orelse (#2 date) = 12) 
  then if((#3 date) >= 1 andalso (#3 date) <= 31) then true else false
  else if ((#2 date) = 4 orelse (#2 date) = 6 orelse (#2 date) = 9 orelse (#2 date) = 11)
       then if ((#3 date) >= 1 andalso (#3 date) <= 30) then true else false
       else if ((#2 date) = 2) 
            then if((#3 date) >= 1 andalso (#3 date) <= 29) 
                 then true 
                 else false
            else false

fun existsInList(date : (int * int * int), month : int) =
  if ((#2 date) = month)
  then true
  else false

fun countOfDays(dates : (int * int * int) list, month : int, count : int) =
  if null dates
  then count
  else if existsInList(hd(dates),month)
       then countOfDays(tl(dates), month, count+1)
       else countOfDays(tl(dates), month, count)

fun number_in_month(dates : (int * int * int) list, month : int) =
  countOfDays(dates,month,0);

fun countOfDaysInMonths(dates : (int * int * int) list, months : (int) list) =
let
  val count = countOfDays(dates, hd(months), 0)
in
  while not(null (tl months)) do 
  (count = count + countOfDays(dates, hd(tl(months)), count); months = tl(months));
  count
end

fun number_in_months(dates : (int * int * int) list, months : (int) list) =
  if null months
  then 0
  else countOfDaysInMonths(dates, months);


  fun dates_in_month(dates : (int * int * int) list, months : int) =
  if null dates
  then []
  else
    let
      val dateInMonth = dates_in_month(tl dates, month)
    in
      if #2 (hd dates) = month
      then (hd dates) :: dateInMonth
      else dateInMonth
    end


fun dates_in_months(dates : (int * int * int) list, months : (int) list) =
  if null months
  then []
  else dates_in_month(dates, hd months) @ dates_in_months(dates, tl months)



fun get_nth(strings : string list, n : int) =
  if n = 1
  then hd strings
  else get_nth(tl strings, n - 1)


fun date_to_string(date : int * int * int) =
let
  val monthInString = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
in
  get_nth(monthInString, #2 date) ^ " " ^ Int.toString(#3 date) ^ ", " ^ Int.toString(#1 date)



fun number_before_reaching_sum(sum : int, numbers : (int) list) =
  if hd numbers >= sum
  then 0
  else 1 + number_before_reaching_sum(sum - (hd numbers), tl numbers)


fun what_month(day : int) =
let
  val totalDaysInMonth = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ]
in
  1 + number_before_reaching_sum(day, days_in_month)
end


(*fun month_range



fun oldest *)
