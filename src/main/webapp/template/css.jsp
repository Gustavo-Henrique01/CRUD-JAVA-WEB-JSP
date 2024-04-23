<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>

    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;700;900&display=swap');

    *, body {
        font-family: 'Poppins', sans-serif;
        font-weight: 400;
        -webkit-font-smoothing: antialiased;
        text-rendering: optimizeLegibility;
        -moz-osx-font-smoothing: grayscale;
    }


 body {
     background-color: #22333b;
 }

.bg-black {
    background-color: #000;
}

#logo {
    width: 30px;
    height: 30px;
    border-radius: 4px;
}

.navbar-brand {
    padding: 14px 20px;
    font-size: 16px;
}

.navbar-nav {
    width: 100%;
}

.nav-item {
    padding: 6px 14px;
    text-align: center;
}

.nav-link {
    padding-bottom: 10px;
}

.v-line {
    background-color: gray;
    width: 1px;
    height: 20px;
}

.navbar-collapse.collapse.in {
    display: block !important;
}


.main-container {
    background-color: #152733;
    padding: 1.5rem;
    margin: 50px auto 50px;
    width: 70%;
    max-width: 100%;

}

.box {
    width: 100%;
    margin: 0 auto 0  ;
    background-color: #152733;
}


@media (max-width: 576px) {
    .nav-item {
        width: 100%;
        text-align: left;
    }

    .v-line {
        display: none;
    }
}

</style>