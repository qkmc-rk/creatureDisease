//修改弹窗样式
export const initDg = (length) => {
    const titleDg = document.querySelectorAll('.el-dialog__title')
    for (let i = 0; i < titleDg.length; i++) {
        titleDg[i].style.fontWeight = "bold"
    }
    const titleHeader = document.querySelectorAll('.el-dialog__header')
    for (let i = 0; i < titleHeader.length; i++) {
        titleHeader[i].style.borderBottom = "1px solid #DBDFE4"
    }
    const titleFooter = document.querySelectorAll('.el-dialog__footer')
    for (let i = 0; i < titleFooter.length; i++) {
        titleFooter[i].style.borderTop = "1px solid #DBDFE4"
    }
    const DgBody = document.querySelectorAll('.el-dialog')
    for (let i = 0; i < DgBody.length; i++) {
        DgBody[i].style.width = "550px"
        DgBody[i].style.borderRadius = "4px"
    }

}