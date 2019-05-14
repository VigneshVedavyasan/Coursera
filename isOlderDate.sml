
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

(* fun number_in_months



fun dates_in_month



fun dates_in_months



fun get_nth



fun date_to_string



fun number_before_reaching_sum



fun what_month



fun month_range



fun oldest *)
