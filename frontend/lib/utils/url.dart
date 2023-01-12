const baseUrl = "http://192.168.1.158:90/";

const loginUrl = "user/login";
const registerUrl = "user/insert";
const updateUserProfileUrl = "user/update/get";
const getUserDetailsUrl = "user/dashboard/get";
const bookAppointmentUrl = "user/bookAppointment/get";
const getBookedAppointmentUrl = "user/getBookedAppointment/get";
const updateAppointmentUrl = "user/updateBookedAppointment/get/";
const deleteAppointmentUrl = "user/deleteBookedAppointment/get/";
const bookCompanyAppointmentUrl = "user/bookVehicleAppointment/get";
const getBookedCompanyAppointmentUrl = "user/getBookedVehicleAppointment/get";
const updateCompanyAppointmentUrl = "user/updateBookedVehicleAppointment/get/";
const deleteBookedCompanyAppointmentUrl = "user/deleteBookedVehicleAppointment/get/";

const getVehicleCategoryUrl = "staff/vehicleCategory";
const getAppointmentHDT = "staff/appointment/dateAndtime/";
const getHealthCateogryIdUrl = "staff/get/vehicleCategoryId/";
const reAddAppointmentTimeUrl = "staff/appointment/time/add/";
const deleteAppointmentTimeUrl = "staff/appointment/time/delete";

const getDepartmentVehicle = "vehicle/category/";

const companyLoginUrl = "company/login";
const getDepartmentCompany = "company/category/";
const companyGetProfile = "company/dashboard/single";
const companyAppointmentStatusUrl = "company/getAppointment/";
const companyAppointmentUpdateStatusUrl = "company/updateAppointmentStatus/";

String? token;