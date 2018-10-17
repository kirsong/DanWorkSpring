//变量线条类型
const borderStyle={
    boldLine:{//加粗
        top: {
            style: 'medium'
        },
        bottom: {
            style: 'medium'
        },
        left: {
            style: 'medium'
        },
        right: {
            style: 'medium'
        }
    },

    nomalLine : {  //正常
        top: {
            style: 'thin'
        },
        bottom: {
            style: 'thin'
        },
        left: {
            style: 'thin'
        },
        right: {
            style: 'thin'
        }
    },

    shopLine:{//免税店Line
        top: {
            style: 'medium'
        },
        bottom: {
            style: 'thin'
        },
        left: {
            style: 'medium'
        },
        right: {
            style: 'medium'
        }
    },


    topBottomRightBold:{//上右下加粗
        top: {
            style: 'medium'
        },
        bottom: {
            style: 'medium'
        },
        left: {
            style: 'thin'
        },
        right: {
            style: 'medium'
        }
    },

    topBottomLeftBold:{//上左下加粗
        top: {
            style: 'medium'
        },
        bottom: {
            style: 'medium'
        },
        left: {
            style: 'medium'
        },
        right: {
            style: 'thin'
        }
    },

    topLeftBold:{//上左
        top: {
            style: 'medium'
        },
        bottom: {
            style: 'thin'
        },
        left: {
            style: 'medium'
        },
        right: {
            style: 'thin'
        }
    },

    topRightBold:{//上右
        top: {
            style: 'medium'
        },
        bottom: {
            style: 'thin'
        },
        left: {
            style: 'thin'
        },
        right: {
            style: 'medium'
        }
    },

    topBottomBold:{//上下加粗
        top: {
            style: 'medium'
        },
        bottom: {
            style: 'medium'
        },
        left: {
            style: 'thin'
        },
        right: {
            style: 'thin'
        }
    },

    topLeftRightBold:{//上左右加粗
        top: {
            style: 'medium'
        },
        bottom: {
            style: 'thin'
        },
        left: {
            style: 'medium'
        },
        right: {
            style: 'medium'
        }
    },

    borderMedium:{//下侧加粗
        top: {
            style: 'thin'
        },
        bottom: {
            style: 'medium'
        },
        left: {
            style: 'thin'
        },
        right: {
            style: 'thin'
        }
    },

    leftBold:{//左侧加粗
        top: {
            style: 'thin'
        },
        bottom: {
            style: 'thin'
        },
        left: {
            style: 'medium'
        },
        right: {
            style: 'thin'
        }
    },

    leftRightBold:{//左右加粗
        top: {
            style: 'thin'
        },
        bottom: {
            style: 'thin'
        },
        left: {
            style: 'medium'
        },
        right: {
            style: 'medium'
        }
    },

    leftBottomBold:{//左下加粗
        top: {
            style: 'thin'
        },
        bottom: {
            style: 'medium'
        },
        left: {
            style: 'medium'
        },
        right: {
            style: 'thin'
        }
    },

    rightBold:{//右侧加粗
        top: {
            style: 'thin'
        },
        bottom: {
            style: 'thin'
        },
        left: {
            style: 'thin'
        },
        right: {
            style: 'medium'
        }
    },

    rightBottomBold:{//右下侧加粗
        top: {
            style: 'thin'
        },
        bottom: {
            style: 'medium'
        },
        left: {
            style: 'thin'
        },
        right: {
            style: 'medium'
        }
    },

    bottomBold:{
        top: {
            style: 'thin'
        },
        bottom: {
            style: 'medium'
        },
        left: {
            style: 'thin'
        },
        right: {
            style: 'thin'
        }
    }
};

//表格内容样式
var cellContentPosition={
    textCenter:{//字体居中
        vertical:'center',
        horizontal:'center'
    },

    textRight:{//字体居左
        vertical:'center',
        horizontal:'right'
    }
};

//使用颜色
var colors={
    labelGreen:"86e38d",//标签绿
    totalGreen:"c4d79c",//合计绿
    otherGreen:"92cf50",//其它绿
    yellow:"ffff00",//黄色
    blueGray:"95B3D7",//浅蓝色
    red:"ff0000",//红色
};

//Excel使用到的样式
var excelStyle={

    //免税店下面的3个LabelStyle
    titleLabelCell:{
        alignment:cellContentPosition.textCenter,
        border:borderStyle.borderMedium,
        font:{
            sz:9
        }
    },

    titleRightLabelCell:{
        alignment:cellContentPosition.textCenter,
        border:borderStyle.rightBottomBold,
        font:{
            sz:9
        }
    },

    //编号
    dataIndexCell:{
        alignment:cellContentPosition.textCenter,
        border:borderStyle.leftRightBold
    },

    //数据内容
    dataItemCell:{
        alignment:cellContentPosition.textRight,
        border:borderStyle.nomalLine
    },

    dataIItemRedcell:{
        alignment:cellContentPosition.textRight,
        border:borderStyle.nomalLine,
        font:{
            color:{rgb : colors.red}
        }
    },

    //右侧加粗数据内容
    dataRightItemCell:{
        alignment:cellContentPosition.textRight,
        border:borderStyle.rightBold
    },

    //合计
    totalLabelCell:{
        alignment:cellContentPosition.textCenter,
        border:borderStyle.boldLine,
        font:{
            sz:14,
        },
        fill:{
            fgColor:{rgb : colors.totalGreen}
        }
    },

    //合计内容
    totalItemCell:{
        alignment:cellContentPosition.textRight,
        border:borderStyle.topBottomBold,
        font:{
            sz:14,
        },
        fill:{
            fgColor:{rgb : colors.totalGreen}
        }
    },

    //合计右侧内容
    totalRightItemCell:{
        alignment:cellContentPosition.textRight,
        border:borderStyle.topBottomRightBold,
        font:{
            sz:14,
        },
        fill:{
            fgColor:{rgb : colors.totalGreen}
        }
    },
};