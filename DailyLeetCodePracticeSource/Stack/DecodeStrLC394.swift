//
//  DecodeStrLC394.swift
//  TryNewLeetCodeTest
//
//  Created by rsaha on 10/12/23.
//


import Foundation
//https://leetcode.com/problems/decode-string/
func getNum(_ str: [Character] , _ pos: inout Int) -> Int {
    var num = 0, i = pos
    while pos < str.count, str[pos].isNumber {
//        num = (num * 10) + (Int(str[pos].utf8.first ?? 0) - Int("0".utf8.first ?? 0))
        pos += 1
    }
    num = Int(String(str[i..<pos]))!    
    return num
    
}
func decodeStringUtil(_ str: [Character] , _ pos: inout Int) -> [Character] {
    var temp = [Character]()
    while pos < str.count, str[pos] != "]" {
        if str[pos].isNumber {
            let num = getNum(str, &pos)
            pos += 1
            let str = decodeStringUtil(str, &pos)
            pos += 1
            for _ in 0..<num {
                temp += str
            }
           
        } else {
            temp.append(str[pos])
            pos += 1
        }
    }
    return temp
    
}
func decodeString(_ str: String) -> String {
    var pos = 0
    
    return String(decodeStringUtil(Array(str), &pos))
}

//class DecodeStrLC394 {
//
//    int getNum(string &s , int &pos) {
//        int num = 0;//, i = pos;
//        while(pos <s.size() && isdigit(s[pos])) {
//            num = num *10 + (s[pos++] - '0');
//        }
//        return num;
//    }
//
//    string decodeStringUtil2(string &s , int &pos) {
//        string temp;
//        while(pos < s.size() && s[pos] != ']') {
//            if(!isdigit(s[pos])) {
//                temp += s[pos++];
//            }
//            else {
//                int num = getNum(s, pos);
//                pos++; // skip the '['
//                string str = decodeStringUtil(s, pos);
//                pos++; // skip the ']'
//
//                for(int i = 0 ; i < num ; i++) {
//                    temp+= str;
//                }
//
//            }
//        }
//        return temp;
//    }
//     string decodeStringUtil(string &s , int &pos) {
//         string temp = "";
//         if(pos >= s.size()) {
//             return temp;
//         }
//
//         if(isdigit(s[pos])) {
//             int num = getNum(s, pos);
//             pos++;
//             string str = decodeStringUtil(s, pos);
//             for(int i = 0 ; i < num; i++) {
//                 temp+= str;
//             }
//             temp = temp + decodeStringUtil(s, pos);
//         }else if(s[pos] == ']') {
//             pos++;
//             return temp;
//         } else {
//             temp += s[pos++];
//             temp = temp + decodeStringUtil(s, pos);
//         }
//         return temp;
//     }
//
//public:
//    string decodeString(string s) {
//        int pos = 0;
//        return decodeStringUtil(s, pos);
//    }
//};
