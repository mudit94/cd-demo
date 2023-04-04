import React from 'react';

interface HelloNameProps {
    name: string;
}

const HelloName: React.FC<HelloNameProps> = ({ name }) => {
    return <h1>Hello {name}</h1>;
};

export default HelloName;
