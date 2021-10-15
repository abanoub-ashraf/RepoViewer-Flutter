import 'dart:convert';

///
/// - this is for converting the client id and client secret in their string format
///   into base64 format
/// 
/// - base64.encode() that's supposed to do that takes a list of int so we need to
///   convert that string format into a list of int
/// 
/// - utf8.encode() does that for us
/// 
/// - so utf8.encode() will take the string format and give us list of int, 
///   that we will give that list of int to the base64.encode()
/// 
/// - but we can merge those 2 convert together by using utf8.fuse(base64)
///   so we can give it the string format and just get a bas64 format right away
///
final stringToBase64 = utf8.fuse(base64);