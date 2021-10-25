//jQuery3.6.0を使っています
$(() => {
//定数
// 読み上げる文章の配列の初期設定
    const initialtext = ["Flash", "Reading", "は、", "語句を", "連続で", "フラッシュ", "表示する「", "高速", "逐次", "視覚", "提示」を", "用いて", "テキストを", "高速に", "読む", "ことを", "可能に", "した", "アプリです。", "", "", "PDFや", "写真を", "テキスト", "エリアに", "ドラッグ", "&", "ドロップ", "すると", "文字を", "読み取る", "ことが", "できます。", "", "", ""];
    

//変数
// 実際に読み上げる文章の配列
    let currenttext = initialtext;
    let speed = $("#speed-slider").val();//document.getElementById("speed-slider").value;
    let textsize = $("#text-slider").val();//document.getElementById("text-slider").value;
    let playing = false;//再生中かどうか
    let index = 0;//現在選択中の配列の要素
    let intervalId;

    for(let i = 0; i < currenttext.length; ++i) {
        $("#container").append('<span class="unit">' + currenttext[i] + '</span>');
    }

// イベントハンドラ
    $("#speed-slider").on("input", () => {
        speed = $("#speed-slider").val();
        $("#display-speed").text(speed);
    });

    $("#text-slider").on("input", () => {
        textsize = $("#text-slider").val();
        $("#display-size").text(textsize);
        $(".unit").css("fontSize", textsize + "px");
    });

    function tick() {
        $(".unit").removeClass("now").eq(index).addClass("now");
        ++index;
        if(index >= currenttext.length) {
            index = 0;
        }
        //36-39行目をまとめてこう書くこともできます この場合index++では正しくありません
        //if(++index >= currenttext.length) index = 0;
    }

    $("#play").click(() => {
        if(playing) {//再生中→一時停止
            clearInterval(intervalId);
            $("#play").text("再生");
        } else {//一時停止中→再生
            intervalId = setInterval(tick, speed);
            $("#play").text("一時停止");
        }
        playing = !playing;
    });

//最初に戻る
    $("#init").click(() => {
        index = 0;
    });

//テキスト読み込み
    $("#text").click(() => {
        let text = $("#main-text").val().replace(/\r\n/g, "\n").replace(/\r/g, "\n");// Mac: \r(CR)　Linux: \n(LF)　Windows: \r\n(CR+LF)
        if(text.length > 0) {
            currenttext = text.split('\n');
        } else {
            currenttext = initialtext;
        }
        index = 0;
        $("#container").html("");
        for(let i = 0; i < currenttext.length; ++i) {
            $("#container").append('<span class="unit">' + currenttext[i] + '</span>');
        }
    });
});