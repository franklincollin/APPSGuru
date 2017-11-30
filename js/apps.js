//special positioning functions based on anchor top and left (not universal and sensitive!)

function punishedStudentListTopLeftPosition() {
    punishedStudentList.x  = deleteDataLayout.x + (deleteDataLayout.width - punishedStudentList.width)
}

function punishedStudentListHorizontalCenter() {
    punishedStudentList.anchors.left = null
}

//end

//special functions (not universal and sensitive!)

function homeFragmentPosition() {
    var position = fragmentHome.x

    if(fragmentHome.x <= -fragmentContainer.width / 3) {
        position = -fragmentContainer.width;
        fragmentEdit.x = 0
        tabIndicator.x = mainWindow.width / 3
        return position;
    }
    else if(fragmentHome.x >= -fragmentContainer.width / 3){
        tabIndicator.x = 0
        return position = 0;
    }
}

function editFragmentPosition() {
    var position = fragmentEdit.x

    if(fragmentEdit.x <= -fragmentContainer.width / 3) {
        position = -fragmentContainer.width;

        fragmentView.x = 0
        tabIndicator.x = (mainWindow.width / 3) * 2

        return position;
    }

    else if(fragmentEdit.x >= fragmentContainer.width / 3) {
        position = fragmentContainer.width

        fragmentHome.x = 0
        tabIndicator.x = 0

        return position;
    }
    else if(fragmentEdit.x > -fragmentContainer.width && fragmentEdit.x < fragmentContainer.width / 3) {
        position = 0

        return position;
    }
}

function viewFragmentPosition() {
    var positionView = fragmentView.x

    if(fragmentView.x >= fragmentContainer.width / 3) {
        positionView = fragmentContainer.width * 2
        fragmentEdit.x = 0
        tabIndicator.x = mainWindow.width / 3

        return positionView
    }
    else if(fragmentView.x > -fragmentContainer.width && fragmentView.x < fragmentContainer.width / 3) {
        positionView = 0

        return positionView
    }
}

function profileDetailPositioning(){
    var profileWidth

    if(fragmentHome.width < fragmentHome.height) {
        profileDetailBox.height = fragmentHome.height / 3
        return profileWidth = fragmentHomeInput.width
    }
    else if(fragmentHome.width > fragmentHome.height) {
        profileDetailBox.height = fragmentHome.height - profileDetailBox.y - 20

        return profileWidth = (fragmentHome.width / 2) - (profileDetailBox.x * 2)
    }
}

function studentListPositioning() {
    var studentListWidth

    if(fragmentHome.width < fragmentHome.height) {
        studentListBox.height = (fragmentHome.height / 100) * 47
        studentListBox.y = profileDetailBox.height + profileDetailBox.y + 20
        studentListBox.x = profileDetailBox.x

        return studentListWidth = profileDetailBox.width
    }
    else if(fragmentHome.width > fragmentHome.height) {
        studentListBox.height = profileDetailBox.height
        studentListBox.y = profileDetailBox.y
        studentListBox.x = profileDetailBox.width + (profileDetailBox.x * 3)

        return studentListWidth = profileDetailBox.width
    }
}

function lateStudentBoxPositioning() {
    var lateStudentwidth

    if(fragmentView.width < fragmentView.height) {
        lateStudentDetail.height = fragmentView.height / 2
        lateStudentDetail.x = fragmentView.x

        return lateStudentwidth = fragmentView.width
    }

    else if(fragmentView.width > fragmentView.height) {
        lateStudentDetail.height = fragmentView.height
        lateStudentDetail.x = fragmentView.x

        return lateStudentwidth = fragmentView.width / 2
    }
}

function lateStudentImage() {
    var imageSize

    if(lateStudentDetail.width > lateStudentDetail.height) {
        return imageSize = (lateStudentDetail.height / 100) * 60
    }

    else if(lateStudentDetail.width < lateStudentDetail.height) {
        return imageSize = (lateStudentDetail.width / 100) * 60
    }
}

function profileImageSize() {
    var imageSize

    if(profileBox.height < profileBox.width) {
        return imageSize = (profileBox.height / 100) * 60
    }
    else if(profileBox.height > profileBox.width) {
        return imageSize = (profileBox.width / 100) * 60
    }
}

function profileImage() {
    var imageSize

    if(parent.width > parent.height) {
        return imageSize = (parent.height / 100) * 60
    }

    else if(parent.width < parent.height) {
        return imageSize = (parent.width / 100) * 60
    }
}

function appsImage() {
    var imageSize

    if(parent.width > parent.height) {
        return imageSize = (parent.height / 100) * 60
    }

    else if(parent.width < parent.height) {
        return imageSize = (parent.width / 100) * 60
    }
}

function fragmentHomePositioned() {
    fragmentHome.x = 0
    fragmentEdit.x = mainWindow.width
    fragmentView.x = mainWindow.width * 2
    tabIndicator.x = 0
}

function fragmentEditPositioned() {
    fragmentHome.x = -mainWindow.width
    fragmentView.x = mainWindow.width
    tabIndicator.x = mainWindow.width / 3
    fragmentEdit.x = 0
}

function fragmentViewPositioned() {
    fragmentEdit.x = -mainWindow.width
    fragmentHome.x = -mainWindow.width * 2
    fragmentView.x = 0
    tabIndicator.x = (mainWindow.width / 3) * 2
}

//end
