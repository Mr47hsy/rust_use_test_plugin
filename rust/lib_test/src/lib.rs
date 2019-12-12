use std::ffi::{CStr, CString};
use std::os::raw::c_char;

#[no_mangle]
pub extern fn hello_world(s: *const c_char) -> *const c_char {
    let mut word = String::from("Hello ");
    let c_str = unsafe {
        assert!(!s.is_null());
        CStr::from_ptr(s)
    };
    word.push_str(c_str.to_str().unwrap());
    word.push_str(" Come To New World.");
    let c_str_word = CString::new(word).unwrap();
    c_str_word.into_raw()
}

#[no_mangle]
pub extern fn free(s: *mut c_char) {
    unsafe {
        if !s.is_null() {
            CString::from_raw(s);
        }
    };
}
