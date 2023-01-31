Student st = new Student();
st.firstName = 'Mary';
st.lastName = 'Smith';
st.classYear = 12;
st.major = 'Physics';
system.debug(st.generateReport());

st.firstName = 'John';
st.lastName = 'Doe';
st.classYear = 5;
st.major = 'Math';
system.debug(st.generateReport());