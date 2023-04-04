import Head from 'next/head'
import Image from 'next/image'
import { Inter } from 'next/font/google'
import { GetServerSideProps } from 'next';
import HelloName from '../components/HelloName';
import styles from '@/styles/Home.module.css'

export const getServerSideProps: GetServerSideProps = async () => {
  const name = process.env.NAME;
  return { props: { name } };
};

interface IndexProps {
  name: string;
}

const Index: React.FC<IndexProps> = ({ name }) => {
  return <HelloName name={name} />;
};

export default Index;
