class HeadLetter < ApplicationRecord

    def get_id(name)
        if name.blank?
            # nameが空の場合強制終了
            return nil
        end
        # 頭文字を入手する
        head = name.chars.first
        # 頭文字を「大文字のアルファベット」または「濁点なしのひらがな」に書き換える
        if ["A","a"].include?(head)
            head = "A"
        elsif ["B","b"].include?(head)
            head = "B"
        elsif ["C","c"].include?(head)
            head = "C"
        elsif ["D","d"].include?(head)
            head = "D"
        elsif ["E","e"].include?(head)
            head = "E"
        elsif ["F","f"].include?(head)
            head = "F"
        elsif ["G","g"].include?(head)
            head = "G"
        elsif ["H","h"].include?(head)
            head = "H"
        elsif ["I","i"].include?(head)
            head = "I"
        elsif ["J","j"].include?(head)
            head = "J"
        elsif ["K","k"].include?(head)
            head = "K"
        elsif ["L","l"].include?(head)
            head = "L"
        elsif ["M","m"].include?(head)
            head = "M"
        elsif ["N","n"].include?(head)
            head = "N"
        elsif ["O","o"].include?(head)
            head = "O"
        elsif ["P","p"].include?(head)
            head = "P"
        elsif ["Q","q"].include?(head)
            head = "Q"
        elsif ["R","r"].include?(head)
            head = "R"
        elsif ["S","s"].include?(head)
            head = "S"
        elsif ["T","t"].include?(head)
            head = "T"
        elsif ["U","u"].include?(head)
            head = "U"
        elsif ["V","v"].include?(head)
            head = "V"
        elsif ["W","w"].include?(head)
            head = "W"
        elsif ["X","x"].include?(head)
            head = "X"
        elsif ["Y","y"].include?(head)
            head = "Y"
        elsif ["Z","z"].include?(head)
            head = "Z"
        elsif ["ぁ","ァ","あ","ア"].include?(head))
            head = "あ"
        elsif ["ぃ","ィ","い","イ"].include?(head))
            head = "い"
        elsif ["ぅ","ゥ","う","ウ","ゔ","ヴ"].include?(head))
            head = "う"
        elsif ["ぇ","ェ","え","エ"].include?(head))
            head = "え"
        elsif ["ぉ","ォ","お","オ"].include?(head))
            head = "お"
        elsif ["か","カ","が","ガ"].include?(head))
            head = "か"
        elsif ["き","キ","ぎ","ギ"].include?(head))
            head = "き"
        elsif ["く","ク","ぐ","グ"].include?(head))
            head = "く"
        elsif ["け","ケ","げ","ゲ"].include?(head))
            head = "け"
        elsif ["こ","コ","ご","ゴ"].include?(head))
            head = "こ"
        elsif ["さ","サ","ざ","ザ"].include?(head))
            head = "さ"
        elsif ["し","シ","じ","ジ"].include?(head))
            head = "し"
        elsif ["す","ス","ず","ズ"].include?(head))
            head = "す"
        elsif ["せ","セ","ぜ","ゼ"].include?(head))
            head = "せ"
        elsif ["そ","ソ","ぞ","ゾ"].include?(head))
            head = "そ"
        elsif ["た","タ","だ","ダ"].include?(head))
            head = "た"
        elsif ["ち","チ","ぢ","ヂ"].include?(head))
            head = "ち"
        elsif ["っ","ッ","つ","ツ","づ","ヅ"].include?(head))
            head = "つ"
        elsif ["て","テ","で","デ"].include?(head))
            head = "て"
        elsif ["と","ト","ど","ド"].include?(head))
            head = "と"
        elsif ["な","ナ"].include?(head))
            head = "な"
        elsif ["に","ニ"].include?(head))
            head = "に"
        elsif ["ぬ","ヌ"].include?(head))
            head = "ぬ"
        elsif ["ね","ネ"].include?(head))
            head = "ね"
        elsif ["の","ノ"].include?(head))
            head = "の"
        elsif ["は","ハ","ば","バ","ぱ","パ"].include?(head))
            head = "は"
        elsif ["ひ","ヒ","び","ビ","ぴ","ピ"].include?(head))
            head = "ひ"
        elsif ["ふ","フ","ぶ","ブ","ぷ","プ"].include?(head))
            head = "ふ"
        elsif ["へ","ヘ","べ","ベ","ぺ","ペ"].include?(head))
            head = "へ"
        elsif ["ほ","ホ","ぼ","ボ","ぽ","ポ"].include?(head))
            head = "ほ"
        elsif ["ま","マ"].include?(head))
            head = "ま"
        elsif ["み","ミ"].include?(head))
            head = "み"
        elsif ["む","ム"].include?(head))
            head = "む"
        elsif ["め","メ"].include?(head))
            head = "め"
        elsif ["も","モ"].include?(head))
            head = "も"
        elsif ["ゃ","ャ","や","ヤ"].include?(head))
            head = "や"
        elsif ["ゅ","ュ","ゆ","ユ"].include?(head))
            head = "ゆ"
        elsif ["ょ","ョ","よ","ヨ"].include?(head))
            head = "よ"
        elsif ["ら","ラ"].include?(head))
            head = "ら"
        elsif ["り","リ"].include?(head))
            head = "り"
        elsif ["る","ル"].include?(head))
            head = "る"
        elsif ["れ","レ"].include?(head))
            head = "れ"
        elsif ["ろ","ロ"].include?(head))
            head = "ろ"
        elsif ["ゎ","ヮ","わ","ワ"].include?(head))
            head = "わ"
        else
            # もし頭文字を書き換えられなかったら強制終了
            return nil
        end

        # 変換された頭文字に対応するHeadLetterテーブルのデータを探す
        head_letters = HeadLetter.where('letter like ?', head+'%').order(:id)
        if head_letters.blank?
            # もし頭文字に対応するHeadLetterテーブルのデータがなければ強制終了する
            return nil
        else
            # 頭文字に対応するHeadLetterテーブルのデータを返り値とする。
            return head_letters.first.id
        end
    end

end
