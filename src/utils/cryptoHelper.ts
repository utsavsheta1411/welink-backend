import bcrypt from 'bcryptjs';
const SECRET: any = process.env.SECRET || "";
import jwt from 'jsonwebtoken';

export const hashAsync = async (password: string) => {
    return await bcrypt.hash(password, 12);
};

export const compareAsync = async (password: string, passwordHash: string) => {
    return await bcrypt.compare(password, passwordHash);
};

export const encrypt = (data: any) => {
    const expired = { expiresIn: "1d" };
    return jwt.sign(data, SECRET);
};

export const decrypt = (token: any) => {
    console.log('SECRET: ', SECRET);
    console.log('jwt.decode(token, SECRET): ', jwt.decode(token, SECRET));
    return jwt.decode(token, SECRET);
};

// eyJhbGciOiJIUzI1NiJ9.dGVzdDE3.STQI8bPX9_Rt9QZDsBZNgg_9xVkWvYWgec4dtOU94XQ
// eyJhbGciOiJIUzI1NiJ9.dGVzdDE2.WndCYuekWs9QI8ieF9SDN601KInDY3Yk-oicy4g0eaM
// 5tiubtk2umihr0p3gr140cpfn56ofm1a
// 9H8Ys4fQt3U4AjnD7jCc5VpW9eY3T5L2J9lP4Zg1jA4X5eW7kR
// 1igrg48ncokbldccm8q5g0e8l7m66sa0
// qhkdm0c36mk1sbu3o4eta5pejmt23mpt