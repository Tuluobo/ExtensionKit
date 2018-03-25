//
//  String.swift
//  ExtensionKit
//
//  Created by Hao Wang on 14/03/2018.
//

import Foundation

extension String: Emptable {
    public var isEmpty: Bool {
        return self.count == 0
    }
}

extension String {
    
    public func substring(from string: String) -> String? {
        guard let range = self.range(of: string) else { return nil }
        return String(self[range.upperBound...])
    }
    
    public func substring(to string: String) -> String? {
        guard let range = self.range(of: string) else { return nil }
        return String(self[...range.lowerBound])
    }
}

// MARK: - 汉子转拼音相关方法
extension String {
    
    /// MD5
    var md5: String {
        fatalError()
    }
    
    /// 随机生成字符串，注意：全是大写
    public static func random(min: Int, max length: Int) -> String {
        let length = Int.random(from: min, to: length)
        let randomCharacters = (0..<length).map { _ in
            Character.random()
        }
        return String(randomCharacters)
    }
    
    /// 判断 String 中是否有汉字
    public var hasIncludeChinese: Bool {
        for ch in self.unicodeScalars {
            // 中文字符范围：0x4e00 ~ 0x9fff
            if (0x4e00 < ch.value && ch.value < 0x9fff) {
                return true
            }
        }
        return false
    }
    
    /// 有音标的拼音
    public var pinyinWithStrip: String {
        let stringRef = NSMutableString(string: self) as CFMutableString
        // 转换为带音标的拼音
        CFStringTransform(stringRef,nil, kCFStringTransformToLatin, false)
        return stringRef as String
    }
    
    /// 没有音标的拼音
    public var pinyinWithoutStrip: String {
        let stringRef = NSMutableString(string: self.pinyinWithStrip) as CFMutableString
        // 去掉音标
        CFStringTransform(stringRef, nil, kCFStringTransformStripCombiningMarks, false)
        return stringRef as String
    }
    
    /// 没有空格的拼音
    public var pinyinWithoutBlank: String {
        return self.pinyinWithoutStrip.replacingOccurrences(of: " ", with: "")
    }
    
    /// 拼音的首字母
    public var pinyinHead: String {
        // 字符串转换为首字母大写
        let pinyin = self.pinyinWithoutStrip.capitalized
        var headPinyinStr = ""
        // 获取所有大写字母
        for ch in pinyin {
            if ch <= "Z" && ch >= "A" {
                headPinyinStr.append(ch)
            }
        }
        return headPinyinStr
    }
}
