use std::ffi::{CStr, CString};
use std::os::raw::c_char;

#[no_mangle]
pub extern fn hello_world(s: *const c_char) -> *const c_char {
    let mut word = String::from("Hello ");
    let cStr = unsafe {
        assert!(!s.is_null());
        CStr::from_ptr(s)
    };
    word.push_str(cStr.to_str().unwrap());
    word.push_str(" Come To New World.");
    let cStrWord = CString::new(word).unwrap();
    cStrWord.into_raw()
}

#[no_mangle]
pub extern fn free(s: *mut c_char) {
    unsafe {
        if !s.is_null() {
            CString::from_raw(s);
        }
    };
}
