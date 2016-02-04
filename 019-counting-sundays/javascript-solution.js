isLeapYear = function(year) {
  if (year % 400 == 0) {
    return true;
  } if (year % 100 == 0) {
    return false;
  } if (year % 4 == 0) {
    return true;
  }
  return false;
};

daysInMonth = function(year, month) {
  var yearMonthDays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
  if (isLeapYear(year) && month == 2) {
    return 29;
  }
  return yearMonthDays[month - 1];
};

var sundaysOnFirstOfMonth = 0;
var dayOfMonth = 1;
var dayOfWeek = 1;
var monthOfYear = 1;
var year = 1900;

while (year < 2001) {

  if (dayOfWeek == 7 && dayOfMonth == 1 && year > 1900) {
    sundaysOnFirstOfMonth++;
  }

  if (dayOfMonth == daysInMonth(year, monthOfYear)) {
    if (monthOfYear == 12) {
      dayOfMonth = 1;
      monthOfYear = 1;
      year++;
    } else {
      dayOfMonth = 1;
      monthOfYear++;
    }
  } else {
    dayOfMonth++;
  }

  if (dayOfWeek == 7) {
    dayOfWeek = 1;
  } else {
    dayOfWeek++;
  }
}

console.log(sundaysOnFirstOfMonth);
