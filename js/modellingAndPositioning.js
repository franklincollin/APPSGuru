//squareSizing functions based on changing in width and height

var variantSquareSize
function variantSquareSizing(variantSquareSize) {
    if(parent.width < parent.height) {
        var size

        return size = (parent.width / 100) * variantSquareSize
    }

    else if(parent.width > parent.height) {
        return size = (parent.height / 100) * variantSquareSize
    }
}

function squareSizing10() {
    var size

    if(parent.width < parent.height) {
        return size = (parent.width / 100) * 10
    }

    else if(parent.width > parent.height) {
        return size = (parent.height / 100) * 10
    }
}

function squareSizing20() {
    var size

    if(parent.width < parent.height) {
        return size = (parent.width / 100) * 20
    }

    else if(parent.width > parent.height) {
        return size = (parent.height / 100) * 20
    }
}

function squareSizing30() {
    var size

    if(parent.width < parent.height) {
        return size = (parent.width / 100) * 30
    }

    else if(parent.width > parent.height) {
        return size = (parent.height / 100) * 30
    }
}

function squareSizing40() {
    var size

    if(parent.width < parent.height) {
        return size = (parent.width / 100) * 40
    }

    else if(parent.width > parent.height) {
        return size = (parent.height / 100) * 40
    }
}

function squareSizing50() {
    var size

    if(parent.width < parent.height) {
        return size = (parent.width / 100) * 50
    }

    else if(parent.width > parent.height) {
        return size = (parent.height / 100) * 50
    }
}

function squareSizing60() {
    var size

    if(parent.width < parent.height) {
        return size = (parent.width / 100) * 60
    }

    else if(parent.width > parent.height) {
        return size = (parent.height / 100) * 60
    }
}

function squareSizing70() {
    var size

    if(parent.width < parent.height) {
        return size = (parent.width / 100) * 70
    }

    else if(parent.width > parent.height) {
        return size = (parent.height / 100) * 70
    }
}

function squareSizing80() {
    var size

    if(parent.width < parent.height) {
        return size = (parent.width / 100) * 80
    }

    else if(parent.width > parent.height) {
        return size = (parent.height / 100) * 80
    }
}

function squareSizing90() {
    var size

    if(parent.width < parent.height) {
        return size = (parent.width / 100) * 90
    }

    else if(parent.width > parent.height) {
        return size = (parent.height / 100) * 90
    }
}

function squareSizing100() {
    var size

    if(parent.width < parent.height) {
        return size = (parent.width / 100) * 100
    }

    else if(parent.width > parent.height) {
        return size = (parent.height / 100) * 100
    }
}

//end

//heightSquareSizing functions based on layout height
function heightSquareSizing10(){
    var size
    size = (parent.height / 100) * 10

    return size
}

function heightSquareSizing20(){
    var size
    size = (parent.height / 100) * 20

    return size
}

function heightSquareSizing30(){
    var size
    size = (parent.height / 100) * 30

    return size
}

function heightSquareSizing40(){
    var size
    size = (parent.height / 100) * 40

    return size
}

function heightSquareSizing50(){
    var size
    size = (parent.height / 100) * 50

    return size
}

function heightSquareSizing60(){
    var size
    size = (parent.height / 100) * 60

    return size
}

function heightSquareSizing70(){
    var size
    size = (parent.height / 100) * 70

    return size
}

function heightSquareSizing80(){
    var size
    size = (parent.height / 100) * 80

    return size
}

function heightSquareSizing90(){
    var size
    size = (parent.height / 100) * 90

    return size
}

function variantHeightSquareSizing(sizeValue) {
    sizeValue = (parent.height / 100) * sizeValue

    return sizeValue
}
//end

//variantTopMargin functions based on height
//use variantTopMargin for responsive vertical margin
var variant
function variantTopMargin(variant) {
    return (parent.height / 100) * variant
}

//variantHorizontalMargin functions based on width
//use variantHorizontalMargin for responsive horizontal margin
function variantHorizontalMargin(horizontalValue) {
    return (parent.width / 100) * horizontalValue
}

//end
